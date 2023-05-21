pipeline {
    agent any

    stages {
        stage('Maven Install') {
    	agent {
      	docker {
        	image 'maven:3.5.0'
        }
      }
      steps {
      	sh 'mvn clean install'
      }
    }
        stage('GET CODE FROM GIT') {
            steps {
                git credentialsId: '937b262e-dc28-45bc-82ad-4ea163e776b5', url: 'https://github.com/gketan91/Sentiment-Analyser.git'
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t senti:latest .'
            }
        }
    }
    
}
