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




CREATE CLUSTER
eksctl create cluster --name Three-Tier-K8s-EKS-Cluster --region ap-south-1 --node-type t2.medium --nodes-min 2 --nodes-max 2
aws eks update-kubeconfig --region ap-south-1 --name Three-Tier-K8s-EKS-Cluster



kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
kubectl port-forward svc/argocd-server -n argocd 8080:443
kubectl port-forward svc/argocd-server -n argocd 8080:443 --address 0.0.0.0

PASSWORD FOR ARGO CD
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d


eksctl delete cluster --name Three-Tier-K8s-EKS-Cluster --region ap-south-1


CONFIGURE ARGO CD
RANCHER
1)ADD jenkins
aws configure
aws s3 cp s3://jenkinsfilea/jenkins_backup.tar.gz jankins-backup.tar.gz
systemctl stop jenkins
tar -zxvf jankins-backup.tar.gz -C /
systemctl start jenkins


1) ADD SONAR TOKEN and URL


1) ADD ACCESS
AmazonEKSAdminPolicy
AmazonEKSClusterAdminPolicy
aws eks update-kubeconfig --region ap-south-1 --name Three-Tier-K8s-EKS-Cluster




1) ARGOCD INTEGRATION WITH PIPELINE
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
kubectl port-forward svc/argocd-server -n argocd 8080:443
kubectl port-forward svc/argocd-server -n argocd 8080:443 --address 0.0.0.0

PASSWORD FOR ARGO CD
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d



DELETE 
kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
