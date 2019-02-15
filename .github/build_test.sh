#!/bin/bash
set -e
set -o pipefail

whoami
pip install --user --no-cache-dir -r requirements.txt
python test_hello_world.py