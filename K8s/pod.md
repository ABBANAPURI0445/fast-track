## Pod commands   
    ```
    kubectl apply -f pod.yml  
    kubectl get pods
    kubectl get pods -w
    kubectl get pods
    kubectl describe pod
    kubectl delete -f pod.yml
    kubectl get pods
    kubectl apply -f pod.yml
    kubectl get pods -l pod=app
    kubectl delete pods -l pod=app
    kubectl apply -f pod.yml
    kubectl exec -it podapp -c appserver /bin/bash
    kubectl exec -it podapp -c webserver /bin/bash
    kubectl logs podname -c container name
    ```