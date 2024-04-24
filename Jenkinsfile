pipeline {
    agent any
    
    tools {
        maven 'maven3'
    }
    
    environment{
        SCANNER_HOME= tool 'sonar-server'
    }
    
    stages {
        stage ('git-clone-sourcecode') {
            steps {
                git branch: 'main', credentialsId: 'GitHub', url: 'https://github.com/aakumar07/devops_aws_12PM.git'
            }
        }
        
        stage ('Code-compile-maven') {
            steps {
                sh "mvn compile"
            }
        }
        
        stage ('code-review-sonnarqube') {
            steps {
                withSonarQubeEnv('sonar-server') {
                  sh ''' $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=SBI \
                        -Dsonar.java.binaries=. \
                        -Dsonar.projectKey=SBI '''
              }
            }
        }
        
        stage ('code-build-maven') {
            steps {
                sh "mvn clean package"
            }
        }
        
        stage ('code-backup-nexus') {
            steps {
                configFileProvider([configFile(fileId: '8ef6d13f-c23f-406b-8b6f-19f30cc58d5c', variable: 'mavensettings')]) {
                   sh "mvn -s $mavensettings clean deploy -DskipTest=true"
              }
            }
        }
        
        stage ('code-deploy-tomcat') {
            steps {
                sshagent(['tomcat']) {
                  sh " scp -o StrictHostKeyChecking=no /var/jenkins_home/workspace/Pipe_Devops_tools/target/HOME_LONE.war ec2-user@172.31.53.38:/opt/tomcat-9/webapps"
              } 
            }
        }
    }
}
