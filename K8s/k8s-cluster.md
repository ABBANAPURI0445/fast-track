## k8s cluster 
   1. Mini kube 
      1. one master-one worker node 
   2. kubeadm 
      1. one  
## architecture: 
   1. master components 
     1. kube-api server
     2. etcd
     3. schedular
     4. control manager 
   2. Worker Node components
      1. kubelet 
      2. Kube proxy
      3. CRI 
## kubernets cluster 
   1. mini kube 1-1  use case: testing manifest files 
   2. kubeadm or kubespray 1-multiple nodes use case: dev , Test
   3. EKS or AKS or GKE multi master - multi node use case: Pre Prod and Production 

## setup kubeadm cluster 
   1. master 2 core cpu 4 gb ram 
   2. worker node 1gb RAM 1 core CPU 
  kubeadm join 172.31.77.178:6443 --token h4ptgw.37e3oeduwsq49vc4 \
    --discovery-token-ca-cert-hash sha256:e10a258879d4ad9ddd51d9ed8842c666bee077ae29626da9549da70fc0f06335 


docker exec -it dockerid /bin/bash

    
