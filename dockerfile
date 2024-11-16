# FROM jenkins/jenkins:lts

# # Switch to root user to install system dependencies
# USER root

# # Update package list and install essential dependencies
# RUN apt-get update && \
#     apt-get install -y sudo git curl && \
#     curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
#     apt-get install -y nodejs

# # Switch back to the Jenkins user
# USER jenkins

# # Copy the plugins file and install plugins specified in plugins.txt
# RUN jenkins-plugin-cli --verbose --plugin "git docker pipeline nodejs"

# # Expose Jenkins port
# EXPOSE 8080

# # Set Jenkins environment variables
# ENV JENKINS_HOME /var/jenkins_home
# ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# # Launch Jenkins with custom options (if necessary)
# CMD ["jenkins"]
