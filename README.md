# 💬 Stable Diffusion Radeon ROCm 📷
- Make sure that your system was fresh (ubuntu 22.04)
- Prepare AMD ROCm Driver install
```
wget https://raw.githubusercontent.com/hqnicolas/StableDiffusionROCm/main/AMD-ROCm-Drivers/prepare.sh
sudo chmod 777 prepare.sh
sudo ./prepare.sh
```
- install AMD ROCm Drivers
```
wget https://raw.githubusercontent.com/hqnicolas/StableDiffusionROCm/main/AMD-ROCm-Drivers/7800install.sh
sudo chmod 7800install.sh
sudo ./7800install.sh
```
- install Docker
```
wget https://raw.githubusercontent.com/hqnicolas/StableDiffusionROCm/main/docker.sh
sudo chmod docker.sh
sudo ./docker.sh
```
- install Docker Compose
```
 sudo apt-get update
 sudo apt-get install docker-compose-plugin
```
- Install Stable Diffusion ROCm
```
git clone https://github.com/hqnicolas/StableDiffusionROCm/tree/main
cd StableDiffusionROCm
sudo docker-compose build stablediff-rocm
```
- Start Stable Diffusion ROCm
```
sudo docker start -a stablediff-rocm-runner
```
- Stop Stable Diffusion ROCm
```
sudo docker stop stablediff-rocm-runner
```
To see a prompt from your GPU usage.
```
watch /opt/rocm-6.0.2/bin/rocm-smi
docker exec -it ollamacontainername /bin/bash -c "watch rocm-smi"
```
