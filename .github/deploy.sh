#!/bin/bash
set -e
set -o pipefail

whoami | groups
sudo chmod -R 777 /github/home/
pip install --user --upgrade pip==18.0
pip install --user --no-cache-dir -r requirements.txt          
~/.local/bin/pyinstaller -F hello_world.py
export TAG=${GITHUB_SHA}
export IMAGE_NAME='python-cicd-workshop'
docker build -t $DOCKER_LOGIN/$IMAGE_NAME -t $DOCKER_LOGIN/$IMAGE_NAME:$TAG .
echo $DOCKER_PWD | docker login -u $DOCKER_LOGIN --password-stdin
docker push $DOCKER_LOGIN/$IMAGE_NAME