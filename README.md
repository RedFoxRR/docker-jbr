# JetBrains Runtime Docker Image
JetBrains Runtime docker image based on ubuntu

See [JetBrains Runtime Source Code](https://github.com/JetBrains/JetBrainsRuntime)

## Docker Hub Reference
You can access Docker Hub page from here:
[Docker Hub Link](https://hub.docker.com/r/redfoxrr/jbr)

# Supported Tags
- `latest`, `21-ha`
- `21`
- `17-ha`
- `17`

`ha` tags and the `latest` tag includes hotswap-agent 2.0.1 bundled inside.

# Pulling The Image
You can pull the image using:

    docker pull redfoxrr/jbr:latest

# Building
**You can build the image using:**

    docker buildx build --load --platform linux/amd64 -t redfoxrr/jbr:latest .

Supported platforms are:
- linux/amd64
- linux/arm64

**You can also specify JetBrains Runtime version and build by using --build-arg flag:**

    docker buildx build --load --build-arg JBRVERSION=21.0.8 --build-arg JBRBUILD=1038.71 --platform linux/amd64 -t redfoxrr/jbr:latest .

You can find version and build values from: [JetBrains Runtime GitHub Releases](https://github.com/JetBrains/JetBrainsRuntime/releases)
