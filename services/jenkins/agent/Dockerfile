FROM adoptopenjdk/maven-openjdk11:latest

ENV DOCKER_VER=19.03.12
ENV KUBECTL_VER=1.18.3
ENV KLAR_VER=2.4.0
ENV SCANCODE_RELEASE=3.1.1

# Install Kubernetes CLI
RUN curl -sLO "https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VER}/bin/linux/amd64/kubectl" \
  && chmod +x kubectl \
  && mv kubectl /usr/bin

# Install Clair client (Klar)
RUN curl -sLo klar "https://github.com/optiopay/klar/releases/download/v${KLAR_VER}/klar-${KLAR_VER}-linux-amd64" \
  && chmod +x klar \
  && mv klar /usr/bin

# Install ScanCode Tool
RUN apt-get update && apt install -y python3.6-dev libbz2-1.0 xz-utils zlib1g libxml2-dev libxslt1-dev python3-venv
RUN curl -sLO "https://github.com/nexB/scancode-toolkit/releases/download/v${SCANCODE_RELEASE}/scancode-toolkit-${SCANCODE_RELEASE}.tar.bz2" \
  && mkdir scancode-toolkit && tar xjvf scancode-toolkit-*.tar.bz2 -C scancode-toolkit --strip-components=1 \
  && update-alternatives --force --install /usr/bin/python python /usr/bin/python3 1 && update-alternatives --config python
WORKDIR scancode-toolkit
RUN ./scancode --help
ENV PATH=$HOME/scancode-toolkit:$PATH

# Install Docker CLI
RUN curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VER}.tgz \
  && tar xzvf docker-${DOCKER_VER}.tgz --strip 1 -C /usr/bin docker/docker \
  && rm docker-${DOCKER_VER}.tgz

# Install Node.js v10.x and sonar-report tool:
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get update && apt-get install -y nodejs
RUN npm install -g sonar-report