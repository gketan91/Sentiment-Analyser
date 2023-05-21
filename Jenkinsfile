pipeline {
    agent any

    stages {
        stage('GET CODE FROM GIT') {
            steps {
                git credentialsId: '937b262e-dc28-45bc-82ad-4ea163e776b5', url: 'https://github.com/gketan91/Sentiment-Analyser.git'
            }
        }
        stage('Docker Build') {
            agent any
            steps {
                sh 'docker build -t senti:latest .'
            }
        }
    }
    
}
