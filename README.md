
# Jenkins Docker Setup with JCasC

This project provides a Jenkins setup using Docker with pre-installed plugins and Jenkins Configuration as Code (JCasC) plugin.

## Prerequisites

- Docker
- Git

## Getting Started

### 1. Fork the Repository

1. Go to the GitHub repository.
2. Click the "Fork" button at the top-right corner of the page.

### 2. Clone the Forked Repository

Open a terminal/command line prompt and cd to the appropriate directory, according to your operating system:

- macOS - /Users/<your-username>/Documents/GitHub/

- Linux - /home/<your-username>/GitHub/

- Windows - C:\Users\<your-username>\Documents\GitHub\ (Use a Git bash command line window, not the usual Microsoft command prompt)

Open your terminal and run the following command:

```sh
git clone https://github.com/YOUR_USERNAME/preconfigured-jenkins-test.git
cd preconfigured-jenkins-test
```

### 3. Prepare the Project
Ensure you have the following files in your project directory:

- Dockerfile
- plugins.txt
- casc_configs/jenkins.yaml

### 4. Build the Docker Image
Run the following command to build the Docker image:

```sh
docker build -t custom-jenkins:latest .
```

### 5. Run the Docker Container
Run the following command to start the Jenkins container:

```sh
docker run -d -v jenkins_home:/var/jenkins_home -p 8080:8080 -p 50000:50000 --restart=on-failure custom-jenkins:latest

```
### 6. Access Jenkins
Open your browser and go to http://localhost:8080. Jenkins should be running with the Configuration as Code setup.

## Configuration
Jenkins Configuration as Code (JCasC) is set up using the casc_configs/jenkins.yaml file. Modify this file to change Jenkins configuration.

## Custom Plugins
The plugins.txt file contains the list of plugins to be installed. Modify this file to add or update plugins.
