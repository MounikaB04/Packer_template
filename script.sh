#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
