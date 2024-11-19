pipeline {
    agent {
        docker {
                image 'node:20'
            }
    }
    
    environment {
        PRODUCTION = "mongodb+srv://binaminhhassan14:jfUdsYD1LHWwKNm5@cluster0.oaihr.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"
        DEVELOPMENT = "mongodb+srv://binaminhhassan14:jfUdsYD1LHWwKNm5@cluster0.oaihr.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"
        TEST = "mongodb+srv://binaminhhassan14:jfUdsYD1LHWwKNm5@cluster0.oaihr.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"
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
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed. Check logs.'
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