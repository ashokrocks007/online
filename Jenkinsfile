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
    }
}
