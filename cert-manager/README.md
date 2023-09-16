# MetalLB
1. Install kong gateway by using helm chart
    ```bash
    helm repo add jetstack https://charts.jetstack.io
    helm repo update
    helm install cert-manager jetstack/cert-manager \
        --namespace cert-manager \
        --create-namespace \
        --version v1.12.0 \
        --set installCRDs=true
    ```

2. Create certificate issuer
   ```bash
   kubectl apply -f cert.yaml
   ```