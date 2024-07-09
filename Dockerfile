FROM jenkins/jenkins:lts-jdk17

# Disable the setup wizard
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# Set the JCasC configuration path
ENV CASC_JENKINS_CONFIG=/var/jenkins_home/casc_configs/jenkins.yaml

# Copy the plugins.txt file and install plugins
COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

# Copy JCasC configuration files
COPY --chown=jenkins:jenkins casc_configs/ /usr/share/jenkins/ref/casc_configs/