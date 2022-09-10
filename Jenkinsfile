pipeline{
    agent any
    stages{
        stage("git checkout"){
            steps{
                git url: "https://github.com/kiranreddy023/onlinebookstore"
            }
        }
        stage("maven build"){
            steps{
                sh "mvn clean package"
            }
        }
    }
}