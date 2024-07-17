pipeline {
    agent none

    stages {
        failFast true
        parallel {
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
}