kubectl top nodes

Start-Sleep 10

kubectl delete namespace sut 
kubectl create namespace sut 

(Get-Content "./../template/deploy-database.yaml") -replace "{{NAMESPACE}}","sut" | kubectl apply -f -
(Get-Content "./../template/deploy-api.yaml") -replace "{{NAMESPACE}}","sut" | kubectl apply -f -
(Get-Content "./../template/deploy-ui.yaml") -replace "{{NAMESPACE}}","sut" | kubectl apply -f -

kubectl get pods -n sut -o wide --watch
