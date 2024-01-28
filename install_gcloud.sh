#!/bin/bash
apt-get update
apt-get install apt-transport-https ca-certificates gnupg curl sudo
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get update && sudo apt-get install google-cloud-cli kubectl google-cloud-sdk-gke-gcloud-auth-plugin
# Extra Opcional: Instalar K9s
curl -sS https://webinstall.dev/k9s | bash
source ~/.config/envman/PATH.env