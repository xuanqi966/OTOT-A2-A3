kind create cluster --name cluster-a2 --config k8s/kind/cluster-config.yaml
docker build ./demo/a2/nginx-sample -t image/a1
kind load docker-image image/a1 --name cluster-a2
kubectl apply -f k8s/manifests/k8s/backend-deployment.yaml
kubectl apply -f k8s/manifests/k8s/backend-service.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
kubectl apply -f k8s/manifests/k8s/backend-ingress.yaml