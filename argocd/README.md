# Argocd

1. Create namespace for Argocd
    ```bash
    kubectl create namespace argocd
    ```
2. Install Argocd
    ```bash
    kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
    ```
3. Access Argocd from expose port (optinal)
    ```bash
    kubectl port-forward svc/argocd-server -n argocd 8080:443
    ```
4. Add repo by using interface
5. Add cluster
    ```bash
    argocd cluster add <CLUSTER_NAME> \
        --name <NAME>
    ```
6. Setup ArgoCD agent for monitor change in each environment
    ```bash
    kubectl apply -f argocd/deployment.yaml -n argocd
    ```