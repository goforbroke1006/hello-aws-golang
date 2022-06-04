#!/bin/bash

set -e

(
  sudo apt update
  sudo apt-get remove -y awscli

  cd ~/ || exit 1
  if [[ ! -f awscliv2.zip ]]; then
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  fi
  unzip -o awscliv2.zip >/dev/null
  sudo ./aws/install --update
  aws --version
)

(
  cd ~/ || exit 1
  if [[ ! -f ./aws-sam-cli-linux-x86_64.zip ]]; then
    curl -O -L https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip
  fi
  unzip -o aws-sam-cli-linux-x86_64.zip -d sam-installation >/dev/null
  sudo ./sam-installation/install --update
  sam --version
)

npm install -g serverless

if [[ ! -f ~/.aws/credentials ]]; then
  aws configure
fi
