pipeline {
    agent any
    environment {
        IMAGE_NAME = "avdeshsainger/abcproject"
    }

    stages {
        stage('code checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/inaeon/ABC-Technologies.git'
            }
        }

        stage('code compile') {
            steps {
                sh 'mvn clean compile'
            }
        }

        stage('code test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('code build') {
            steps {
                sh 'mvn package'
            }
        }

        stage('docker image build') {
            steps {
                sh 'cp target/ABCtechnologies-1.0.war .'
                sh "docker build -t ${IMAGE_NAME}:${BUILD_NUMBER} ."
            }
        }

        stage('docker image push') {
            steps {
                withDockerRegistry([credentialsId:"hub.docker.com", url:""]) {
                    sh "docker push ${IMAGE_NAME}:${BUILD_NUMBER}"
                }
            }
        }

        stage('application deployment') {
            steps {
                sh "kubectl apply -f abcdeploy.yaml"
                sh "kubectl apply -f abcservice.yaml"
            }
        }
    }
}