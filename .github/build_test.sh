#!/bin/bash
set -e
set -o pipefail

whoami | groups
sudo chmod -R 777 /github/home/
pip install --user --no-cache-dir -r requirements.txt
python test_hello_world.py