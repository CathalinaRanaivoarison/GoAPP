pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/ST2DCE/project.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("my-go-app", ".")
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    docker.run("my-go-app", "-p 8080:8080")
                }
            }
        }
    }
}
