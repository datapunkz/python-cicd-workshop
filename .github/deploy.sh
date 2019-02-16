#!/bin/bash
set -e
set -o pipefail

<<<<<<< HEAD
# Deploy app
sudo chmod -R 777 /github/
# pip install --user --upgrade pip==18.0
# pip install --user --no-cache-dir -r requirements.txt        
# echo ${DOCKER_LOGIN}
# echo ${DOCKER_PWD}  
~/.local/bin/pyinstaller -F hello_world.py
export TAG=${GITHUB_SHA}
export IMAGE_NAME='python-cicd-workshop'
export DOCKER_IMAGE_NAME=${DOCKER_LOGIN}/${IMAGE_NAME}
# docker build -t ${DOCKER_IMAGE_NAME} -t ${DOCKER_IMAGE_NAME}:${TAG} .
# echo ${DOCKER_PWD} | docker login -u ${DOCKER_LOGIN} --password-stdin
=======
sudo chmod -R 777 /github/
pip install --user --upgrade pip==18.0
pip install --user --no-cache-dir -r requirements.txt          
~/.local/bin/pyinstaller -F hello_world.py
export TAG=${GITHUB_SHA}
export IMAGE_NAME='python-cicd-workshop'
export DOCKER_LOGIN='ariv3ra'
export DOCKER_IMAGE_NAME=${DOCKER_LOGIN}/${IMAGE_NAME}
docker build -t ${DOCKER_IMAGE_NAME} -t ${DOCKER_IMAGE_NAME}:${TAG} .
echo ${DOCKER_PWD} | docker login -u ${DOCKER_LOGIN} --password-stdin
>>>>>>> master
docker push ${DOCKER_IMAGE_NAME}