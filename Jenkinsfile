pipeline{
    agent any
    stages{        
        stage("maven build"){
            steps{
                sh "mvn clean package"
            }
        }
         stage("docker build"){
            steps{
                sh "docker build -t kiran023/obstore:01 ."
            }
        }
    }
}