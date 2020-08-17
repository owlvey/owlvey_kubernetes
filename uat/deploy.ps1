kubectl delete namespace owlvey

kubectl top nodes

Start-Sleep 10

kubectl create namespace owlvey

(Get-Content "./../template/deploy-database.yaml") -replace "{{NAMESPACE}}","owlvey" | kubectl apply -f -
(Get-Content "./../template/deploy-api.yaml") -replace "{{NAMESPACE}}","owlvey" | kubectl apply -f -
(Get-Content "./../template/deploy-ui.yaml") -replace "{{NAMESPACE}}","owlvey" | kubectl apply -f -

kubectl apply -f "route-owlvey.yaml"

kubectl get pods -n owlvey -o wide --watch
#kubectl get services -n owlvey -o wide --watch
#kubectl get endpoints -n owlvey -o wide --watch
#http://uat.site.owlvey.com:30701/site/auth/login