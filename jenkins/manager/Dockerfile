FROM jenkins/jenkins:2.244

ENV CASC_JENKINS_CONFIG /var/casc_config
ENV JAVA_OPTS=-Djenkins.install.runSetupWizard=false

USER root

# Install Docker - Debian instructions https://docs.docker.com/engine/install/debian/
RUN apt-get update && \
    apt-get -y install apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
    $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get -y install docker-ce

# Automated plugin install from plugins.txt
COPY jenkins_config/plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# Jenkins CASC - Configuration as code
COPY jenkins_config/config.yaml /var/casc_config/config.yaml

# Drop back to the regular jenkins user - good practice
USER jenkins