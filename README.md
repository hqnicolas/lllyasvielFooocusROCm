# 💬 Runing lllyasviel Fooocus on AMD ROCm 📷
- Make sure that your system was fresh (ubuntu 22.04)
- Prepare AMD ROCm Driver install
```
sudo apt-get update
sudo apt-get install wget
sudo apt-get install git
wget https://raw.githubusercontent.com/hqnicolas/lllyasvielFooocusROCm/main/AMD-ROCm-Drivers/prepare.sh
sudo chmod 777 prepare.sh
sudo ./prepare.sh
```
- install AMD ROCm Drivers
```
wget https://raw.githubusercontent.com/hqnicolas/lllyasvielFooocusROCm/main/AMD-ROCm-Drivers/7800install.sh
sudo chmod 7800install.sh
sudo ./7800install.sh
```
- install Docker
```
wget https://raw.githubusercontent.com/hqnicolas/lllyasvielFooocusROCm/main/docker.sh
sudo chmod docker.sh
sudo ./docker.sh
```
- install Docker Compose
```
 sudo apt-get update
 sudo apt-get install docker-compose-plugin
```
- Install lllyasviel/Fooocus
```
git clone --branch 2.2.1 https://github.com/lllyasviel/Fooocus.git
cd Fooocus
source fooocus_env/bin/activate
pip3 install -r requirements_versions.txt
```
- Run this pip Install torch
```
pip install torch==2.1.2+rocm5.6 torchvision==0.16.2+rocm5.6 --extra-index-url https://download.pytorch.org/whl/rocm5.6
```
- Start Fooocus
```
export HSA_OVERRIDE_GFX_VERSION=11.0.0
source fooocus_env/bin/activate
python entry_with_update.py --listen --attention-split
```
To see a prompt from your GPU usage.
```
watch /opt/rocm-6.0.2/bin/rocm-smi
docker exec -it ollamacontainername /bin/bash -c "watch rocm-smi"
```
