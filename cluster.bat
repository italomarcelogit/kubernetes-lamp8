@echo off
echo Gerenciando k3d clusters
if [%1] == [] (
    echo Para criar um cluster digite: cluster start nomedocluster
    echo Para excluir um cluster digite: cluster del nomedocluster
    echo Para listar os clusters digite: cluster list
)
if [%1] == [start] (
    if [%2] NEQ [] (
        echo Criando K3D Cluster: %2
        k3d cluster create %2 --agents 2 --servers 1 -p "8080:30000@loadbalancer"  -p "8081:30001@loadbalancer"
    ) else ( echo Sintaxe incorreta. Digite cluster start nomedocluster )
)
if [%1] == [del] (
    if [%2] NEQ [] (
        echo Excluindo K3D Cluster: %2
        k3d cluster delete %2
    ) else ( echo Sintaxe incorreta. Digite cluster del nomedocluster )
)
if [%1] == [list] (
    k3d cluster list
)
pause
cls