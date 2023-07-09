if [ $1 == "excluir" ];
then
  /usr/bin/clear
  echo "Parando a implementaçao"
  kubectl delete -f yaml-maria/service.yaml
  kubectl delete -f yaml-maria/deployment.yaml
  kubectl delete -f yaml-php/deployment.yaml
  kubectl delete -f yaml-php/service.yaml
  kubectl delete -f yaml-pma/deployment.yaml
  kubectl delete -f yaml-pma/service.yaml
  echo "Excluindo definitivamente os dados"
  kubectl delete --all -f yaml-maria/volume.yaml
elif [ $1 == "parar" ];
then
  /usr/bin/clear
  echo "Parando Containers"
  kubectl delete -f yaml-maria/service.yaml
  kubectl delete -f yaml-maria/deployment.yaml
  kubectl delete -f yaml-php/deployment.yaml
  kubectl delete -f yaml-php/service.yaml
  kubectl delete -f yaml-pma/deployment.yaml
  kubectl delete -f yaml-pma/service.yaml
elif [ $1 == "iniciar" ];
then
  /usr/bin/clear
  echo "Iniciando Containers"
  kubectl apply -f yaml-maria/volume.yaml
  kubectl apply -f yaml-maria/deployment.yaml
  kubectl apply -f yaml-maria/service.yaml
  kubectl apply -f yaml-pma/deployment.yaml
  kubectl apply -f yaml-pma/service.yaml
  kubectl apply -f yaml-php/deployment.yaml
  kubectl apply -f yaml-php/service.yaml
elif [ $1 == "reiniciar" ];
then
  /usr/bin/clear
  echo "Reiniciando Containers"
  ./container.sh parar
  ./container.sh iniciar
elif [ $1 == "ajuda" ];
then
  /usr/bin/clear
  echo "Para INICIAR a implementação de containers, digite: ./container iniciar"
  echo "Para PARAR a implementação de containers, digite: ./container parar"
  echo "Para EXCLUIR OS DADOS de uma implementaçao, digite: ./container excluir"
fi
kubectl get pv
kubectl get pvc
kubectl get deployments