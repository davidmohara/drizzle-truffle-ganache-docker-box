#!/usr/bin/env bash

apt install git -y
git clone https://github.com/pablomaseda/voting-dapp.git voting-dapp

docker-compose -f docker-compose-dev.yml build
