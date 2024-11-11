FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get install -y sudo git curl

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs


USER jenkins

RUN jenkins-plugin-cli --verbose --plugins "git:4.10.0 docker:1.1.9 pipeline:2.6 nodejs:1.4.0"

EXPOSE 8080

ENV JENKINS_HOME /var/jenkins_home

CMD ["jenkins", "--httpPort=8080"]