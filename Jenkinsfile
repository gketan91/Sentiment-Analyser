pipeline {
   agent any
  
   environment {
       DOCKER_HUB_REPO = "gketan91/flask-hello-world"
       CONTAINER_NAME = "senti1"
 
   }
  
   stages {
       stage('Checkout') {
           steps {
               checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/gketan91/Sentiment-Analyser.git']])
           }
       }
       stage('STOP RUNNING DOCKER IMAGES'){
            steps{
                echo 'Stoping running images'
                sh 'docker stop $CONTAINER_NAME'
            }
       }
       stage('Build') {
           steps {
               echo 'Building..'
               sh 'docker image build -t $DOCKER_HUB_REPO:latest .'
           }
       }
	   stage('Deploy') {
           steps {
               echo 'Deploying....'
               sh 'docker run -d -p 8000:8000 --name $CONTAINER_NAME $DOCKER_HUB_REPO'
		   
           }
       }

   }
}
