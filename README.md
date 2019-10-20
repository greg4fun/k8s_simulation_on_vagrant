# Kubernetes cluster on your localhost with help of vagrant and virtualbox

Requirements:

vagrant

virtualbox



This solution is contructed out of 1 master VM, n-workers VMs, and a player VM (ansible player)

You can config more or less workers than default (which is 4) if you just want to run cluster with 4 workers go to step 2

1) CONFIG : you can adjust number of workers you want to have in your cluster it depends on your hardware how many it can handle

** to add workes edit Vagrantfile and change N to in 5th line to number of workers you need 

** change hosts file to match number of workers you will need to add ips to them too 


2) BUILD VMs needed for cluster : clone this repo go inside folder and run 

vagrant up 

3) When vagrant finished buildinmg all hosts -from within the folder ssh to player 

vagrant ssh player


4) go to /vagrant

cd vagrant  

5) Ask ansible to install k8s on VMs

ansible-playbook -i hosts  1_k8s_install.yml

6) set up cluster on master VM 

ansible-playbook -i hosts 2_master_cluster_setup.yml

7) join your workers to cluster 

ansible-playbook -i hosts 3_workers_join_cluster.yml

8) check if cluster nodes are connected
disconnect from player 

vagrant ssh master

kubectl get nodes - you should see all workers in ready status

check deployment folder for additional deployment of an app to kubes
