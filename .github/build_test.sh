#!/bin/bash
set -e
set -o pipefail

whoami | groups
sudo chmod -R 777 /github/
pip install --user --upgrade pip==18.0
pip install --user --no-cache-dir -r requirements.txt
python test_hello_world.py