pipeline {
    agent any
    
    tools {
        maven 'my_maven'
    }
    
    environment {
        GITNAME = 'tkdals5846' 
        GITEMAIL = 'tkdals5846@naver.com'
        GITWEBADD = 'https://github.com/tkdals5846/sb_code.git'
        GITSSHADD = 'git@github.com:tkdals5846/sb_code.git'
        GITCREDENTIAL = 'git_cre'
        
        DOCKERHUB = 'mini0916'
        DOCKERCREDENTIAL = 'docker_cre'
    }
    
    stages {
        stage('Checkout Github') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [],
                userRemoteConfigs: [[credentialsId: GITCREDENTIAL, url: GITWEBADD]]])
            }
            post {
            
                failure {
                    echo 'Repository clone failure'
                }
                success {
                    echo 'Repository clone success'
                }
            }
        }
        
        stage('Code build') {
            steps {
                sh 'mvn clean package'
            }
        }
        
        stage('image build') {
            steps {
                sh 'docker build -t ${DOCKERHUB}:${DOCKERCREDENTIAL} .'
                sh 'docker build -t ${DOCKERHUB}:latest .'
            }
        }
        
        stage('image push') {
            steps {
                 sh 'docker push  ${DOCKERHUB}:${currentBuild.number}'
                 sh 'docker push  ${DOCKERHUB}:latest
            }
            
            post {
                failure {
                    echo 'docker image push failure' 
                    sh 'docker image rm -f ${DOCKERHUB}:${currentBuild.number}'
                    sh 'docker image rm -f ${DOCKERHUB}:latest'
                }
                
                success {
                    echo 'docker image push success' 
                    sh 'docker image rm -f ${DOCKERHUB}:${currentBuild.number}'
                    sh 'docker image rm -f ${DOCKERHUB}:latest'
                }
            }
        }
    }
}