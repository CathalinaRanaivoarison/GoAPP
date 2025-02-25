pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', 
                    credentialsId: 'github-credentials-id', 
                    url: 'https://github.com/CathalinaRanaivoarison/GoAPP.git'
            }
        }
        
        stage('Afficher l\'arborescence et le répertoire') {
            steps {
                script {
                    sh 'pwd'
                    sh 'ls -R'
                }
            }
        }
        
        stage('Check Docker Version') {
            steps {
                script {
                    sh 'docker --version'
                }
            }
        }
        
        
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("my-go-app", ".")
                }
            }
        }

        stage('Stop Existing Container') {
            steps {
                script {
                    sh 'docker stop my-go-app-container || true'
                    sh 'docker rm my-go-app-container || true'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh 'docker run -d -p 8081:8081 --name my-go-app-container my-go-app'
                }
            }
        }
    }
}
