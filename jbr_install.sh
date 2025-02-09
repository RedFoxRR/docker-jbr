case $1 in
    amd64)
        ARCH="x64" 
        ;;
    arm64) 
        ARCH="aarch64" 
        ;;
    *) 
        echo "Unsupported architecture: ${TARGETARCH}"
        exit 1 
        ;; 
esac

curl -L "https://cache-redirector.jetbrains.com/intellij-jbr/jbrsdk-${JBRVERSION}-linux-musl-$ARCH-b${JBRBUILD}.tar.gz" -o /tmp/jbr-${JBRVERSION}.tar.gz

mkdir /usr/lib/jvm
tar -xzf /tmp/jbr-${JBRVERSION}.tar.gz -C /usr/lib/jvm
mv -f /usr/lib/jvm/jbrsdk-${JBRVERSION}-linux-musl-$ARCH-b${JBRBUILD} /usr/lib/jvm/jbr-${JBRVERSION}
rm -f /tmp/*
