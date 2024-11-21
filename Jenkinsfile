pipeline {
    agent any
    
    environment {
        PRODUCTION = "mongodb+srv://binaminhhassan14:jfUdsYD1LHWwKNm5@cluster0.oaihr.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"
        DEVELOPMENT = "mongodb+srv://binaminhhassan14:jfUdsYD1LHWwKNm5@cluster0.oaihr.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"
        TEST = "mongodb+srv://binaminhhassan14:jfUdsYD1LHWwKNm5@cluster0.oaihr.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"

         EMAIL_BODY = 

        """

            <p>EXECUTED: Job <b>\'${env.JOB_NAME}:${env.BUILD_NUMBER})\'</b></p>

            <p>

            View console output at 

            "<a href="${env.BUILD_URL}">${env.JOB_NAME}:${env.BUILD_NUMBER}</a>"

            </p> 

            <p><i>(Build log is attached.)</i></p>

        """

        EMAIL_SUBJECT_SUCCESS = "Status: 'SUCCESS' -Job \'${env.JOB_NAME}:${env.BUILD_NUMBER}\'" 

        EMAIL_SUBJECT_FAILURE = "Status: 'FAILURE' -Job \'${env.JOB_NAME}:${env.BUILD_NUMBER}\'" 

        EMAIL_RECEPIENT = 'bin.amin@moringaschool.com'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    sh 'npm install'
                }
            }
        }

        stage('Run Tests') {
            steps {
                sh 'npm test'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }

        stage('Deploy') {
            steps {
                script {
                    echo 'Deploying Application'
                    sh 'curl -X POST https://api.render.com/deploys/rnd_9KZG6DR1UmXSLp8Bx6uciCKsOTuu'
                }
            }
        }
    }

    post {
        success {
            slackSend(
                channel: '#devops',
                color: 'good',
                message: "Build ${currentBuild.fullDisplayName} completed successfully!  url:'https://github.com/Binamin-hussein100/Gallery-Docker'",
                
            )
             emailext attachLog: true, 
                body: EMAIL_BODY, 

                subject: EMAIL_SUBJECT_SUCCESS,

                to: EMAIL_RECEPIENT
        }
        failure {
            slackSend(
                channel: '#devops',
                color: 'bad',
                message: "Build ${currentBuild.fullDisplayName} successful!"
            )
             emailext attachLog: true, 
                 body: EMAIL_BODY, 

                subject: EMAIL_SUBJECT_FAILURE, 

                to: EMAIL_RECEPIENT
        }
        always {
            cleanWs() 
        }
    }
}







 // docker {
            //     image 'node:20' // Use the Node.js image
            //     args '-u root:root' // Run as root if necessary
            // }