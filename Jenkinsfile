pipeline {
    agent none

    stages {
        stage('Run uname') {
            agent { label 'macos' }

            steps {
               sh 'uname -a'
            }
        }
        stage('Run uname on azure'){
            agent { label 'agent1' }
            
            steps {
                sh 'uname -a'
            }
        }
        
    }
}