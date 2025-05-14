FROM openjdk:17-jdk-slim

LABEL maintainer="yourname@example.com"

# Install Maven, Git, Docker CLI, and dependencies
RUN apt-get update && \
    apt-get install -y \
        maven \
        git \
        curl \
        gnupg2 \
        ca-certificates \
        lsb-release \
        apt-transport-https \
        software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list && \
    apt-get update && \
    apt-get install -y docker-ce-cli && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Verify installations

# Verify installations
RUN java -version && mvn -version && git --version && docker --version

# Set work directory
WORKDIR /app

CMD ["bash"]
