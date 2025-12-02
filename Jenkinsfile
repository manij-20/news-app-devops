pipeline {
    agent any

    stages {
        stage('checkout') {
            steps {
                sh "rm -rf news-app-devops"
              sh  "git clone https://github.com/manij-20/news-app-devops.git"
            }
        }
   stage(' build') {
            steps {
                sh "mvn clean package"
            }
        }
         stage('Test') {
            steps {
                sh "mvn test"
            }
        }
 //    stage('version build') {
   //         steps {
     //           sh "mvn "
       //     }
        //}
         stage('deploy tomcat') {
            steps {
                sh  "rm -rf /opt/apache-tomcat-9.0.112/webapps/news-app.war"
                sh "sudo cp /var/lib/jenkins/workspace/multi_branch_feature-2/target/news-app.war /opt/apache-tomcat-9.0.112/webapps"
            }
        }
  // stage('Upload Artifact to JFrog') {
    //steps {
      //  sh 'mvn deploy'
    //}
//}
    }
}
