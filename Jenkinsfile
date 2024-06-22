pipeline {
   agent any
  
   environment {
       DOCKER_HUB_REPO = "gketan91/sentiment-webapp"
       CONTAINER_NAME = "senti1"
       DOCKERHUB_CREDENTIALS=credentials('dockerhub-cred-gketan91')
       SCANNER_HOME=tool 'sonar-scanner'
 
   }
  
   stages {
    stage('cleanWorkspace') {
           steps {
               cleanWs()
           }
       }
       stage(' Git Checkout') {
           steps {
               checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/gketan91/Sentiment-Analyser.git']])
           }
       }
    //    stage('STOP RUNNING DOCKER IMAGES'){
    //         steps{
    //             echo 'Stoping running images'
    //     //         sh 'docker stop $CONTAINER_NAME'
    //     //         sh 'docker rm $(docker ps --filter status=exited -q)'
	// 	// sh 'docker rmi $(docker images -a -q)'
    //         }
    //    }
    stage('STOP RUNNING DOCKER IMAGES'){
    steps{
        script {
            echo 'Checking if the container is running..'
            def isRunning = sh(script: "docker ps -q --filter 'name=$CONTAINER_NAME'", returnStdout: true).trim()
            if (isRunning) {
                echo 'Stopping running images'
                sh "docker stop $CONTAINER_NAME"
                sh "docker rm $CONTAINER_NAME"
            } else {
                echo 'No running containers found with the name: $CONTAINER_NAME'
            }
        }
    }
}

       stage('SonarQube Analysis') {
			steps{
                withSonarQubeEnv('sonar-server') {
                    sh ''' $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=senti \
                    -Dsonar.projectKey=senti  '''
                }
            }

		}
        stage('TRIVY FS SCAN') {
            steps {
                sh "trivy fs . > trivyfs.txt"
            }
        }
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
            withCredentials([usernamePassword(credentialsId: 'aws-cli-credentials', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                sh """ # Use environment variables for AWS credentials
                aws configure set aws_access_key_id \${AWS_ACCESS_KEY_ID}
                aws configure set aws_secret_access_key \${AWS_SECRET_ACCESS_KEY}
                # ... rest of your AWS CLI commands
                aws eks update-kubeconfig --region ap-south-1 --name Three-Tier-K8s-EKS-Cluster
                kubectl rollout restart deployment sentiment-deployment -n senti
                """
                }
        }
}


   }

   post {
		always {
			sh 'docker logout'
		}
	}

}
