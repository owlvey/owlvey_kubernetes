(Get-Content "./../template/deploy-database.yaml") -replace "{{NAMESPACE}}","sut" | kubectl delete -f -
(Get-Content "./../template/deploy-api.yaml") -replace "{{NAMESPACE}}","sut" | kubectl delete -f -
(Get-Content "./../template/deploy-ui.yaml") -replace "{{NAMESPACE}}","sut" | kubectl delete -f -