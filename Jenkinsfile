pipeline {
    agent any
    
    tools {
        maven 'my_maven'
    }
    
    environment {
        GITNAME = 'tkdals5846' // 보쿠노 깃허브ID
        GITEMAIL = 'tkdals5846@naver.com' // 와타시노 이메일
        GITWEBADD = 'https://github.com/tkdals5846/sb_code.git'
        GITSSHADD = 'git@github.com:tkdals5846/sb_code.git'
        GITCREDENTIAL = 'git_cre'   // 젠킨스에서 생성한 git credential
    }
    
    stages {
        stage('Build') {
            steps {
                echo 'Building..'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
