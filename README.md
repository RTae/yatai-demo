1. Provision infrastucture
    ```bash
    cd terraform
    make apply ENV=dev
    ```
2. Create namesapce
    ```bash
    kubectl create ns yatai-system
    kubectl create ns maine-coon
    ```

3. DB secret
    ```bash
    export ROOT_USER="yatai"
    export ROOT_PASSWORD="123qweasdzxc"
    export ROOT_DB="yatai"

    kubectl create secret generic db-secret \
        --from-literal=ROOT_USER="$ROOT_USER" \
        --from-literal=ROOT_PASSWORD="$ROOT_PASSWORD" \
        --from-literal=ROOT_DB="$ROOT_DB" \
        -n yatai-system
    ```
4. Storage secret
    ```bash
    export STORAGE_USERNAME="yatai"
    export STORAGE_PASSWORD="123qweasdzxc"
    export STORAGE_SSL=false
    export STORAGE_BUCKET_NAME="yatai"

    kubectl create secret generic storage-secret \
        --from-literal=STORAGE_USERNAME="$STORAGE_USERNAME" \
        --from-literal=STORAGE_PASSWORD="$STORAGE_PASSWORD" \
        --from-literal=STORAGE_SSL="$STORAGE_SSL" \
        --from-literal=STORAGE_BUCKET_NAME="$STORAGE_BUCKET_NAME" \
        -n yatai-system
    ```

5. Create SA secret to access artifact registry
    ```bash
    export REGISTRY_PASSWORD="`cat ./mlop.json | base64`"

    kubectl create secret generic docker-registry-secret \
        --from-literal=REGISTRY_PASSWORD="$REGISTRY_PASSWORD" \
        -n yatai-system
    ```
6. Install nginx-ingress
    ```bash
    helm install ingress-nginx ingress-nginx \
      --repo https://kubernetes.github.io/ingress-nginx \
      --namespace ingress-nginx \
      --create-namespace
    ```
7. Install cert-manager
    ```bash
    helm repo add jetstack https://charts.jetstack.io
    helm repo update
    helm install cert-manager jetstack/cert-manager \
        --namespace cert-manager \
        --version v1.11.0 \
        --create-namespace \
        --set installCRDs=true

    kubectl apply -f cert-manager/cert.yaml
    ```

8. Install Yatai cluster
    ```bash
    helm dependency build ./yatai-cluster

    helm install yatai-cluster ./yatai-cluster \
    -f ./yatai-cluster/values.yaml \
    --namespace yatai-system
    ```

9.  Install Argocd by reading **README.md**

10. Install Prometenus
    ```bash
    helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
    helm repo update prometheus-community

    helm install prometheus prometheus-community/kube-prometheus-stack \
    -f ./observability/prometheus-values.yaml \
    --namespace yatai-system
    ```

11. Install Grafana
    ```bash
	helm repo add grafana https://grafana.github.io/helm-charts
	helm repo update grafana

    helm install grafana grafana/grafana \
    -f ./observability/grafana-values.yaml \
    --namespace yatai-system
    ```

12. Install Obervability
   ```bash
   kubectl apply -f observability/metric.yaml

   kubectl -n yatai-system create configmap bentodeployment-dashboard --from-file=./observability/bentodeployment-dashboard.json
   kubectl -n yatai-system label configmap bentodeployment-dashboard grafana_dashboard=1

   kubectl -n yatai-system create configmap bentofunction-dashboard --from-file=./observability/bentofunction-dashboard.json
   kubectl -n yatai-system label configmap bentofunction-dashboard grafana_dashboard=1
   ```
