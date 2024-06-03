FROM jenkins/jenkins:lts-jdk17

# Disable the setup wizard
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# Set the JCasC configuration path
ENV CASC_JENKINS_CONFIG=/var/jenkins_home/casc_configs

# Copy initial setup state file
COPY jenkins.install.UpgradeWizard.state /var/jenkins_home/

# Create necessary directories and copy custom files
RUN mkdir -p /usr/share/jenkins/ref/init.groovy.d
COPY init.groovy.d/security.groovy /usr/share/jenkins/ref/init.groovy.d/security.groovy

# Copy the plugins.txt file and install plugins
COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

# Copy JCasC configuration files
COPY --chown=jenkins:jenkins casc_configs/ /var/jenkins_home/casc_configs/
