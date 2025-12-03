pipeline {
    agent any

    tools {
        jdk 'JDK17'
        maven 'maven'
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'feature-1', url: 'https://github.com/manij-20/news-app-devops.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package -DskipTests=false'
            }
        }
        stage('Run Tests') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Deploy WAR to Tomcat') {
            steps {
                sh '''
                    TOMCAT_PATH="/opt/apache-tomcat-10.1.49/webapps"
                    WAR_FILE="target/news-app.war"

                    echo "Cleaning old deployment..."
                    rm -rf $TOMCAT_PATH/news-app $TOMCAT_PATH/news-app.war

                    echo "Copying new WAR..."
                    cp $WAR_FILE $TOMCAT_PATH/

                    echo "Restarting Tomcat..."
                    pkill -f 'org.apache.catalina.startup.Bootstrap' || true
                    nohup $TOMCAT_PATH/../bin/startup.sh &
                '''
            }
        }
    }
    post {
        success {
            echo 'Build and deployment completed successfully!'
        }
        failure {
            echo 'Build or deployment failed. Check logs for details.'
        }
    }
    stage('Push the artifacts into JFrog Artifactory') {
    steps {
        script {
            // Get the current date and time in the format: yyyy-MM-dd_HH-mm
            def currentDate = new java.text.SimpleDateFormat("yyyy-MM-dd_HH-mm").format(new Date())

            // Define the target path with the timestamp
            def targetPath = "news-app-devops/${currentDate}/"

            // Upload the artifact to JFrog Artifactory with the timestamped path
            rtUpload(
                serverId: "jfrog",
                spec: """{
                    "files": [
                        {
                            "pattern": "*.war",
                            "target": "${targetPath}"
                        }
                    ]
                }"""
            )
        }
    }
}

}
