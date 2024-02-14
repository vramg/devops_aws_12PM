#! /bin/bash

# Installing java
yum install java-1.8.0-openjdk-devel.x86_64 -y

# Install Git
yum install git -y

# Adding maven repos
sudo wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
 
# Using sed editor
sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo

# Installing the maven
 sudo yum install -y apache-maven
