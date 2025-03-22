# JetBrains Runtime Docker Image
JetBrains Runtime docker image based on alpine

See [JetBrains Runtime Source Code](https://github.com/JetBrains/JetBrainsRuntime)

## Docker Hub Reference
You can access Docker Hub page from here:
[Docker Hub Link](https://hub.docker.com/r/redfoxrr/jbr)

# Pulling The Image
You can pull the image using:

    docker pull redfoxrr/jbr:latest

# Building
**You can build the image using:**

    docker buildx build --platform linux/amd64 -t redfoxrr/jbr:latest .

Supported platforms are:
- linux/amd64
- linux/arm64

**You can also specify JetBrains Runtime version and build by using --build-arg flag:**

    docker buildx build --build-arg JBRVERSION=21.0.6 --build-arg JBRBUILD=872.80 --platform linux/amd64 -t redfoxrr/jbr:latest .

You can find version and build values from: [JetBrains Runtime GitHub Releases](https://github.com/JetBrains/JetBrainsRuntime/releases)
