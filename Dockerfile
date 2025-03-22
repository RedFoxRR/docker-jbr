FROM alpine/curl:latest

LABEL maintainer="RedFox <contact@redfox.tr>"

ARG TARGETARCH

ARG JBRVERSION=21.0.6
ARG JBRBUILD=895.97

RUN apk add --no-cache bash

COPY jbr_install.sh /tmp/

# Run JBR install script
RUN sh /tmp/jbr_install.sh ${TARGETARCH}

ENV JAVA_HOME=/usr/lib/jvm/jbr-${JBRVERSION}
ENV PATH=$PATH:/usr/lib/jvm/jbr-${JBRVERSION}/bin

# Ensure java is installed
RUN java -version

# Override alpine/curl entrypoint
ENTRYPOINT ["/bin/bash", "-c"]

CMD ["java -version"]
