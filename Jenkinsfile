pipeline {
    agent any
   
    environment {
        AWS_ACCESS_KEY_ID = credentials('ABREHAM_AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('ABREHAM_AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "us-west-2"
    }
    stages {
        stage('Checkout') {
            steps {
           git branch: 'main', url: 'https://github.com/aget2101/infra-jan24.git'
  
            }
        }
    
        stage ("terraform init") {
            steps {
                sh "terraform init" 
            }
        }
  
        stage ("plan") {
            steps {
                sh "terraform plan" 
            }
        }
        stage (" Action") {
            steps {
                sh 'terraform ${action} --auto-approve' 
           }
        }
        stage("Deploy to EKS") {
            when {
               expression { params.apply }
            }
            steps {
                  sh "aws eks update-kubeconfig --name eks_cluster"
                   sh "kubectl apply -f deployment.yml"
             }
        }
    }
}
   
    
