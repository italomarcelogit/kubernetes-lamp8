@echo off
echo Comandos Kubectl
if [%1] == [excluir] (
  echo Parando a implementaçao
  kubectl delete -f yaml-maria/service.yaml
  kubectl delete -f yaml-maria/deployment.yaml
  kubectl delete -f yaml-php/deployment.yaml
  kubectl delete -f yaml-php/service.yaml
  kubectl delete -f yaml-pma/deployment.yaml
  kubectl delete -f yaml-pma/service.yaml
  echo Excluindo definitivamente os dados
  kubectl delete --all -f yaml-maria/volume.yaml
)
if [%1] == [parar] (
  echo Parando Containers
  kubectl delete -f yaml-maria/service.yaml
  kubectl delete -f yaml-maria/deployment.yaml
  kubectl delete -f yaml-php/deployment.yaml
  kubectl delete -f yaml-php/service.yaml
  kubectl delete -f yaml-pma/deployment.yaml
  kubectl delete -f yaml-pma/service.yaml
)
if [%1] == [iniciar] (
  echo Iniciando Containers
  kubectl apply -f yaml-maria/volume.yaml
  kubectl apply -f yaml-maria/deployment.yaml
  kubectl apply -f yaml-maria/service.yaml
  kubectl apply -f yaml-pma/deployment.yaml
  kubectl apply -f yaml-pma/service.yaml
  kubectl apply -f yaml-php/deployment.yaml
  kubectl apply -f yaml-php/service.yaml
)
if [$1] == [reiniciar] (
  echo Reiniciando Containers
  ./container.sh parar
  ./container.sh iniciar
)
if [$1] == [ajuda] (
  echo Para INICIAR a implementação de containers, digite: ./container iniciar
  echo Para PARAR a implementação de containers, digite: ./container parar
  echo Para EXCLUIR OS DADOS de uma implementaçao, digite: ./container excluir
)

kubectl get pv
kubectl get pvc
kubectl get deployments