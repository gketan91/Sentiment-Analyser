pipeline {
   agent any
  
   environment {
       DOCKER_HUB_REPO = "gketan91/sentiment-webapp${BUILD_NUMBER}"
       CONTAINER_NAME = "senti1"
       DOCKERHUB_CREDENTIALS=credentials('dockerhub-cred-gketan91')
 
   }
  
   stages {
       stage('Checkout') {
           steps {
               checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/gketan91/Sentiment-Analyser.git']])
           }
       }
    //    stage('STOP RUNNING DOCKER IMAGES'){
    //         steps{
    //             echo 'Stoping running images'
    //             sh 'docker stop $CONTAINER_NAME'
    //             sh 'docker rm $(docker ps --filter status=exited -q)'
		    
    //         }
    //    }
       stage('Build') {
           steps {
               echo 'Building..'
               sh 'docker image build -t $DOCKER_HUB_REPO:latest .'
           }
       }
       stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}
        stage('Push') {

			steps {
				sh 'docker push $DOCKER_HUB_REPO:latest'
			}
		}
	   stage('Deploy') {
           steps {
               echo 'Deploying....'
               sh 'docker run -d -p 8000:8000 --name $CONTAINER_NAME $DOCKER_HUB_REPO'
           }
       }

   }

   post {
		always {
			sh 'docker logout'
		}
	}

}
