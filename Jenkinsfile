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
        DOCEKRHUB = ''
        DOCEKRCREDENTIAL = ''
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
                sh 'docker build -t oolralra/srping:1.0 .'
            }
        }
    }
}