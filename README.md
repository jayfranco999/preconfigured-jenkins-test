# Jenkins Docker Setup with JCasC

This project provides a Jenkins setup using Docker with pre-installed plugins and Jenkins Configuration as Code (JCasC) plugin.

## Prerequisites

- Docker
- Git
- Ngrok

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
- .env file with JENKINS_AGENT_SSH_PUBKEY, JENKINS_AGENT_PRIVATEKEY and JENKINS_EXT_URL values
- docker-compose.yml

### 4. Build and run the Docker Image using docker-compose
cd to the local directory consisting this repo and run the following command to build and start the Jenkins instance:

```sh
docker compose up —build -—force-recreate
```
### 5. Host the port 8080 on a public Ngrok url
Follow the steps in the link to ensure your ngrok is up and running:
https://ngrok.com/docs/getting-started/
Once ngrok is installed, run:

```sh
ngrok http http://localhost:8080
```

### 5. Access Jenkins
Open your browser and go to the ngrok url generated. Jenkins should be running with the Configuration as Code setup. test for difference
<img width="852" alt="image" src="https://github.com/user-attachments/assets/e13cf933-c65a-4684-8838-7b3a03fd6123">

## Generating an SSH Key pair for your Jenkins controller
Follow the steps in the following link to generate the values required for the .env file
https://www.jenkins.io/doc/book/using/using-agents/#generating-an-ssh-key-pair

## Setting up a local inbound agent 

### Download and run the MacOS_inbound_agent jar file on any local directory on your local computer
Click on the MacOS_inbound_agent under build executor status on your Jenkins controller UI and use the curl command below to download the agent jar file:

![image](https://github.com/user-attachments/assets/e30d86e7-439c-450f-ac99-2d8cfd509c5f)

To run the agent, copy the 2nd command in the above image with the webSocket flag at the end of the command

```sh
-webSocket
```

## Create a parallel pipeline job using the Jenkinsfile

###1. Select 'New Item' on the Jenkins dashboard
<img width="365" alt="image" src="https://github.com/user-attachments/assets/e6785597-252b-4ca3-ae63-cbe0ffd74802">

### 2. Select pipeline and name your pipeline
<img width="1100" alt="image" src="https://github.com/user-attachments/assets/29caf186-8dd5-432a-80e8-da65e008c21e">

### 3. Scroll down to pipeline definition and select 'Pipeline from SCM'
<img width="1224" alt="image" src="https://github.com/user-attachments/assets/d93fadf7-272a-483a-9709-854777776ced">

### 4. Add this github repository link and specify branch as 'main'
repo link:- https://github.com/jayfranco999/preconfigured-jenkins-test.git 
<img width="1171" alt="image" src="https://github.com/user-attachments/assets/26add33a-16f4-4b41-9151-aefbfd7fac5b">
save and apply.

### 5. Make the build
Dashboard > YOUR_PIPE > Build Now
<img width="366" alt="image" src="https://github.com/user-attachments/assets/1ee2cd53-49f0-4d1f-bb77-da59c792bc69">
The build should run a parallel pipeline on your inbound and ssh agents.
<img width="1383" alt="image" src="https://github.com/user-attachments/assets/1cd4b9e6-7729-4221-8f10-a9a2606cecee">


## Configuration
Jenkins Configuration as Code (JCasC) is set up using the casc_configs/jenkins.yaml file. Modify this file to change Jenkins configuration.

## Custom Plugins
The plugins.txt file contains the list of plugins to be installed. Modify this file to add or update plugins.

## Docker compose down

To restart or stop the jenkins controller, use the docker-compose down command with the -v flag. Any changes in casc_configs will reflect only on restarting the container after docker-compose down command.

```sh
docker-compose down -v
```
