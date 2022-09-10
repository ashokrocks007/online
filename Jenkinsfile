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
        stage("docker push"){
            steps{
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'pswd', usernameVariable: 'user')]) {
                    sh "docker login -u ${user} -p ${pswd}"
                    sh "docker push kiran023/obstore:01"
                }
            }
        }
        stage("docker deploy"){
            steps{
                sshagent(['Tomcat']) {
                    sh "ssh -o StrictHostKeyChecking=no ec2-user@123.123.99.17 docker rm -f obstore"
                    sh "ssh ec2-user@123.123.99.17 docker run -d -p 8080:8080 --name obstore kiran023/obstore:01"
                }
            }
        }
    }
}
