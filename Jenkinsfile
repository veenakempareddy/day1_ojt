pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout your source code repository
                git branch: 'main', url: 'https://github.com/veenakempareddy/day1_ojt.git'
            }
        }
        
        stage('build ami') {
            steps {
                // Run packer init
                //sh 'packer init packer/.'
                sh 'packer build packer/golden-ami.pkr.hcl'
            }
        }

        stage('create autoscaling') {
            steps {
                sh 'terraform init'
                sh 'terraform apply -auto-approve'
        
    }
}
