pipeline{
    agent any
    stages{
        stage("git checkout"){
            steps{
                git url: "https://github.com/kiranreddy023/onlinebookstore", branch: "main"
            }
        }
        stage("maven build"){
            steps{
                sh "mvn clean package"
            }
        }
    }
}