kubectl cluster-info

kubectl get svc -n kube-system

kubectl create namespace owlvey

kubectl delete deployments --all --namespace owlvey 

kubectl delete -f frontend\owlvey-frontend-deployment.yaml
kubectl create -f frontend\owlvey-frontend-deployment.yaml
kubectl create -f backend\owlvey-backend-deployment.yaml

TIMEOUT 5
# https://medium.com/google-cloud/kubernetes-nodeport-vs-loadbalancer-vs-ingress-when-should-i-use-what-922f010849e0
kubectl expose deployment deploy-site --port=47000 --target-port=80 --namespace owlvey
# proxy de acceso al cluster  kubectl proxy --port=8080
# http://localhost:8080/api/v1/proxy/namespaces/<NAMESPACE>/services/<SERVICE-NAME>:<PORT-NAME>/

# https://medium.com/google-cloud/kubernetes-nodeport-vs-loadbalancer-vs-ingress-when-should-i-use-what-922f010849e0

kubectl apply -f frontend\owlvey-site-service.yaml

kubectl apply -f backend\owlvey-backend-service.yaml

kubectl delete service site-service --namespace owlvey 

kubectl get services --namespace owlvey -o wide
kubectl get endpoints site-service --namespace owlvey 
kubectl describe services site-service --namespace owlvey 

kubectl get nodes --namespace owlvey -o wide
kubectl describe nodes docker-desktop

kubectl describe service deploy-site --namespace owlvey
TIMEOUT 10

kubectl delete -f state\owlvey-state-deployment.yaml
kubectl create -f state\owlvey-state-deployment.yaml

kubectl get deployments --namespace owlvey
kubectl get pod --namespace owlvey
kubectl get services --namespace=owlvey
kubectl describe deployments deploy-site --namespace owlvey
kubectl describe deployments deploy-state --namespace owlvey
