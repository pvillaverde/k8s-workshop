# Obradoiro de introdución a Kubernetes e Google Cloud

## Instalar gcloud e kubectl en Debian/Ubuntu
En caso de dúbidas consultar a [Guía Oficial de gcloud](https://cloud.google.com/sdk/docs/install?hl=es-419#deb)
```bash
apt-get update
apt-get install apt-transport-https ca-certificates gnupg curl sudo
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get update && sudo apt-get install google-cloud-cli kubectl google-cloud-sdk-gke-gcloud-auth-plugin
# Extra Opcional: Instalar K9s
curl -sS https://webinstall.dev/k9s | bash
source ~/.config/envman/PATH.env
```
### Activar a Service Account de Google e configurar o kubeconfig
```bash
gcloud auth activate-service-account sa.json
gcloud container clusters get-credentials stg-pablovillaverde-gcp --region europe-west1 --project pablovillaverde
```

## Prácticas de Kubernetes
```bash
# Crear un namespace propio propio: 
kubectl create namespace NOME_DO_VOSO_NAMESPACE
# Configurar ese namespace por defecto:
kubectl config set-context --current --namespace=NOME_DO_VOSO_NAMESPACE
# Recuperar o listado de Pods (con -A recuperamos de ALL namespaces).  Tamén hai opción "-wide" para sacar en formato lista con máis información.
kubectl get pods -A
kubectl get pods -A -o wide
# Executar un POD co nome "nginx" e a imaxe "nginx:latest"
kubectl run nginx --image=nginx:latest
# Describe o pod "nginx", dando máis información sobre o mesmo.
kubectl describe pod nginx
# Devolve a información do pod "nginx" en YAML (máis completo que o describe).
kubectl get pod nginx -o yaml
# Executar unha Terminal Interactiva no pod "nginx". Dentro do pod executa o comando "bash"
kubectl exec -ti nginx -- bash
# Fai unha redirección de portos co pod nginx redireccionado o porto local 8083 cara o porto 80 do pod.
kubectl port-forward pods/nginx 8083:80
# Recupera os logs do pod "nginx". Co "-f" hace follow de los logs (para ver o que vai saindo)
kubectl logs -f nginx
# Borrar un pod
kubectl delete pod nginx
# Aplicar un manifesto de Kubernetes
kubectl apply -f exemplos/pod.yaml
# Borrar un manifesto previamente aplicado
kubectl delete -f exemplos/pod.yaml
# Modificar o número de réplicas do replicaset nginx
kubectl scale replicaset nginx --replicas 5
# Fixar a imaxe do contenedor "nginx" do deployment "nginx" en "nginx:1.24"
kubectl set image deploy/nginx nginx=nginx:1.24
# Comprobar o estado de actualización do deployment "nginx"
kubectl rollout status deploy/nginx
# Comprobar o historial de actualización do deployment "nginx"
kubectl rollout history deploy/nginx
# Ver máis detalles dunha versión concreta do deployment "nginx"
kubectl rollout history deployment/nginx --revision=2
# Desfacer a última actualización do deployment "nginx"
kubectl rollout undo deploy/nginx
# Configurar o HPA (Horizontal Pod Autoscaler) do deployment "nginx" a un mínimo de 2 réplicas, máximo de 4 e que escale cando o uso medio da cpu estea a un 60%
kubectl autoscale deployment/nginx-deployment --min=2 --max=4 --cpu-percent=60

## Outros comandos
# Comprobar todos os recursos de K8s e as súas abreviaturas
kubectl api-resources -o wide
```

# Ligazóns de intere
- [Documentación de Kubernetes](https://kubernetes.io/)
- [Smooth Sailing With Kubernetes (K8s Google Comic)](https://cloud.google.com/kubernetes-engine/kubernetes-comic?utm_source=twitter&utm_medium=unpaidsoc&utm_campaign=FY20-Q4-KubeCon&utm_content=-&utm_term=-)
- Documental de K8s (1h): [Parte 1](https://www.youtube.com/watch?v=BE77h7dmoQU) / [Parte 2](https://www.youtube.com/watch?v=318elIq37PE)
- Contacto en Linkedin: https://www.linkedin.com/in/pvillaverdecastro/
- Web da empresa: https://ackstorm.com 
- GitHub: https://github.com/pvillaverde 


