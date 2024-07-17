pipeline {
    agent none

    stages {
        stage('Run parallel stages') {
            failFast true
            parallel {
                stage('Run uname on MacOS') {
                    agent {
                        label 'macos'
                    }
                    steps {
                        sh 'uname -a'
                    }
                }
                stage('Run uname on Azure') {
                    agent {
                        label 'agent1'
                    }
                    steps {
                        sh 'uname -a'
                    }
                }
            }
        }
    }
}
