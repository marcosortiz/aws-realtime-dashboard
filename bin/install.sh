#!/bin/bash

# Installing terraform on Amazon Linux
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform

# Installing amplify cli
npm install -g @aws-amplify/cli