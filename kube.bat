@echo off
echo Comandos Kubectl
if [%1] == [] (
    echo Para inicializar os manifestos, digite kube start
    echo Para excluir os manifestos, digite kube del
    kubectl get services
    kubectl get deployments
)
if [%1] == [start] (
    kubectl apply -f yaml-php/deployment.yaml
    kubectl apply -f yaml-php/service.yaml

    kubectl apply -f yaml-maria/deployment.yaml
    kubectl apply -f yaml-maria/volume.yaml

    kubectl apply -f yaml-pma/deployment.yaml
    kubectl apply -f yaml-pma/service.yaml
)
if [%1] == [del] (
    kubectl delete -f yaml-php/deployment.yaml
    kubectl delete -f yaml-php/service.yaml

    kubectl delete -f yaml-pma/deployment.yaml
    kubectl delete -f yaml-pma/service.yaml
)

