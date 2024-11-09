FROM jenkins/jenkins:lts

# Switch to root user to install necessary dependencies
USER root

# Update and install any extra dependencies you might need
RUN apt-get update && apt-get install -y sudo git curl

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

# Install MongoDB tools for potential database operations from Jenkins
RUN apt-get install -y mongodb-clients

# Switch back to the jenkins user to run Jenkins
USER jenkins

# Install additional Jenkins plugins (Optional)
RUN jenkins-plugin-cli --plugins "git docker pipeline nodejs"

# Expose Jenkins port (default: 8080)
EXPOSE 8080

# Set Jenkins home directory
ENV JENKINS_HOME /var/jenkins_home

# Start Jenkins
CMD ["jenkins", "--httpPort=8080"]