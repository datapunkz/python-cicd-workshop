#!/bin/bash
set -e
set -o pipefail

# Deploy app
sudo chmod -R 777 /github/
sudo groupadd docker
sudo usermod -aG docker $USER
# pip install --user --upgrade pip==18.0
# pip install --user --no-cache-dir -r requirements.txt        
# echo ${DOCKER_LOGIN}
# echo ${DOCKER_PWD}  
~/.local/bin/pyinstaller -F hello_world.py
export TAG=${GITHUB_SHA}
export IMAGE_NAME='python-cicd-workshop'
export DOCKER_IMAGE_NAME=ariv3ra/${IMAGE_NAME}
docker build -t ${DOCKER_IMAGE_NAME} -t ${DOCKER_IMAGE_NAME}:${TAG} .
echo ${DOCKER_PWD} | docker login -u ${DOCKER_LOGIN} --password-stdin
docker push ${DOCKER_IMAGE_NAME}