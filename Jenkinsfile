pipeline{
    agent any
    stages{        
       stage("maven build"){
            steps{
                sh "mvn clean package"
            }
        }

        stage("uploading to nexus"){
            steps{
                nexusArtifactUploader artifacts: [[artifactId: 'obstore', classifier: '', file: 'target/obstore-0.1.war', type: 'war']],
                credentialsId: 'nexus',
                groupId: 'onlinebookstore', 
                nexusUrl: '15.206.167.226:8081', 
                nexusVersion: 'nexus3', 
                protocol: 'http', 
                repository: 'maven-hosted',
                version: '0.1'
            }
        }
        /*
        stage("nexus pull"){
            steps{
                sh "wget --user=admin --password=kiran23 http://43.204.110.228:8081/repository/kiran/in/kkrv/Kiran/0.1/Kiran-0.1.war"
            }
        }
        */      
        
         stage("docker build"){
            steps{
                sh "docker build -t kiran023/obstore:02 ."
            }
        }
        stage("docker push"){
            steps{
                withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'pswd', usernameVariable: 'user')]) {
                    sh "docker login -u ${user} -p ${pswd}"
                    sh "docker push kiran023/obstore:01"
                }
            }
        }
        /*
        stage("docker deploy"){
            steps{
                sshagent(['ssh-Key']) {
                    sh "ssh -o StrictHostKeyChecking=no ec2-user@123.123.99.17 docker rm -f obstore"
                    sh "ssh ec2-user@123.123.99.17 docker run -d -p 8080:8080 --name obstore kiran023/obstore:01"
                }
            }
        }
        */
    }
}
