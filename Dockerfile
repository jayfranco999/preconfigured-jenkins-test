FROM jenkins/jenkins:jdk17

# Disable the setup wizard
ENV JAVA_OPTS=-Djenkins.install.runSetupWizard=false

# Set the JCasC configuration path
ENV CASC_JENKINS_CONFIG=/var/jenkins_home/casc_configs/jenkins.yaml

# Install necessary tools
USER root
RUN apt-get update && apt-get install -y wget jq

# Copy the plugins.txt file and install plugins
COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

# Copy JCasC configuration files
COPY --chown=jenkins:jenkins casc_configs/ /usr/share/jenkins/ref/casc_configs/

# Copy the scripts
COPY --chown=jenkins:jenkins bin/ /usr/share/jenkins/ref/

# Make sure the update-plugins.sh script is executable
RUN chmod +x /usr/share/jenkins/ref/update-plugins.sh

# Run the update-plugins.sh script
RUN /usr/share/jenkins/ref/update-plugins.sh
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

