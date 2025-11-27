pipeline {
    agent any

    environment {
        APP_NAME = "vulnerable-app"
    }

    stages {

        stage('Checkout') {
            steps {
                git url: 'https://github.com/JOAKOO123/proyecto-vulnerable.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${APP_NAME} ."
            }
        }

        stage('Run App Container') {
            steps {
                sh "docker run -d --name ${APP_NAME} -p 5000:5000 ${APP_NAME}"
                sh "sleep 5"
            }
        }

        stage('Security Scan - OWASP ZAP') {
            steps {
                sh 'chmod +x zap-scan.sh'
                sh './zap-scan.sh'
            }
            post {
                always {
                    archiveArtifacts artifacts: 'reports/zap/zap-report.html', allowEmptyArchive: true
                }
            }
        }

        stage('Stop Container') {
            steps {
                sh "docker stop ${APP_NAME} || true"
                sh "docker rm ${APP_NAME} || true"
            }
        }
    }

    post {
        always {
            echo "Pipeline Finished."
        }
    }
}
