#! /bin/bash

#Installing Java 11
amazon-linux-extras install java-openjdk11 -y

#Installng git tool for configure to jenkins
sudo yum install git -y

#Add the Jenkins repo
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

	
#Import the key file:
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# Installing jenkins
sudo yum install jenkins -y

# Start the jenkis server
sudo systemctl start jenkins
