FROM jenkins/jenkins:lts

USER root
RUN apt-get update && apt-get install -y sudo
USER jenkins

# Install any dependencies you need, e.g., Git, Docker, etc.
RUN jenkins-plugin-cli --plugins "git docker pipeline"
