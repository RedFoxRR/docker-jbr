FROM ubuntu:24.04

LABEL maintainer="RedFox <contact@redfox.tr>"

ARG TARGETARCH

ARG JBRVERSION=21.0.8
ARG JBRBUILD=1038.71

ARG HOTSWAPAGENT=true
ARG HOTSWAPAGENTVERSION=2.0.2

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    bash \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

RUN case "${TARGETARCH}" in \
        amd64)  ARCH="x64" ;; \
        arm64)  ARCH="aarch64" ;; \
        *) echo "Unsupported architecture: ${TARGETARCH}" && exit 1 ;; \
    esac \
    && curl -L "https://cache-redirector.jetbrains.com/intellij-jbr/jbrsdk-${JBRVERSION}-linux-$ARCH-b${JBRBUILD}.tar.gz" -o /tmp/jbr-${JBRVERSION}.tar.gz \
    && mkdir /usr/lib/jvm \
    && tar -xzf /tmp/jbr-${JBRVERSION}.tar.gz -C /usr/lib/jvm \
    && mv -f /usr/lib/jvm/jbrsdk-${JBRVERSION}-linux-$ARCH-b${JBRBUILD} /usr/lib/jvm/jbr-${JBRVERSION} \
    && rm -f /tmp/*

RUN if [ "$HOTSWAPAGENT" = "true" ] ; then \
        mkdir -p /usr/lib/jvm/jbr-${JBRVERSION}/lib/hotswap && \
        curl -L "https://repo1.maven.org/maven2/org/hotswapagent/hotswap-agent/${HOTSWAPAGENTVERSION}/hotswap-agent-${HOTSWAPAGENTVERSION}.jar" -o /usr/lib/jvm/jbr-${JBRVERSION}/lib/hotswap/hotswap-agent.jar && \
        curl -L "https://repo1.maven.org/maven2/org/hotswapagent/hotswap-agent-core/${HOTSWAPAGENTVERSION}/hotswap-agent-core-${HOTSWAPAGENTVERSION}.jar" -o /usr/lib/jvm/jbr-${JBRVERSION}/lib/hotswap/hotswap-agent-core.jar ; \
    fi

ENV JAVA_HOME=/usr/lib/jvm/jbr-${JBRVERSION}
ENV PATH=$PATH:/usr/lib/jvm/jbr-${JBRVERSION}/bin

# Ensure java is installed
RUN java --version

CMD ["java", "--version"]
