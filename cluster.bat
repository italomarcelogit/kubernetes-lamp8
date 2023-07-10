@echo off
echo Comandos k3d
echo Caso queira utilizar a clusterização do K3D, seguem comandos abaixo
if [%1] == [criar] (
    k3d cluster create meucluster -a 3 -p 30000:30000 -p 30001:30001
)
if [%1] == [excluir] (
    k3d cluster delete meucluster
)