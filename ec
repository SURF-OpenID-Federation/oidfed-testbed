#! /bin/bash

docker build -t oidf-testbed .
docker run -it --rm --name mk-oidf-testbed-config -v "$PWD":/app -w /app/config oidf-testbed \
  /usr/bin/python3 ./env2json.py -t /app/config/leafs_config.json.template -o /app/config/leafs_config.json
 
docker run -it --rm --name mk-oidf-testbed -v "$PWD":/app -w /app oidf-testbed /usr/bin/python3 mkOIDfedEntityConfig.py
