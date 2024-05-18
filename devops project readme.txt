ADD NODE PENDING IN EKS

Plugin
Docker 
Sonar 

Credintal
GITHUB 
DockerHUB  dockerhub-cred-gketan91
SONARTOKEN 

TOOLS:
SonarQube Scanner installations : 
name : sonar-scanner
Version latest 5.0


SYSTEM :
SonarQube servers
sonar-server
SERVER URL
SONARTOKEN

NEW -PIPELINE
Pipline Script from SCM
GIT
REPO URL
CREDENTIAL
BRANCH - MAIN


SONAR SERVER 
NEW PROJECT CREATE TOKEN

systemctl stop jenkins
aws s3 cp s3://jenkinsfilebucket/jankins-backup.tar jankins-backup.tar.gz
https://drive.google.com/file/d/1nfjAQbJKl4hmThVEHzlJyfLcBjhLe5Nh/view?usp=sharing

https://drive.usercontent.google.com/downloadid1nfjAQbJKl4hmThVEHzlJyfLcBjhLe5Nh&export=download&authuser=&confirm=t&uuid18f7a04-72a1-49c6-88f4-3ee808eb9e5f&at=APZUnTVlo7uNQFy0JQXVpFfhtJss%3A1715524674212


tar -zxvf jankins-backup.tar.gz -C /
systemctl start jenkins


CREATE CLUSTER
eksctl create cluster --name Three-Tier-K8s-EKS-Cluster --region ap-south-1 --node-type t2.medium --nodes-min 2 --nodes-max 2
aws eks update-kubeconfig --region ap-south-1 --name Three-Tier-K8s-EKS-Cluster

kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
kubectl port-forward svc/argocd-server -n argocd 8080:443
kubectl port-forward svc/argocd-server -n argocd 8080:443 --address 0.0.0.0


eksctl delete cluster --name Three-Tier-K8s-EKS-Cluster --region ap-south-1

