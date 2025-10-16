pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                // Add your build commands here
                // For example: sh 'mvn clean compile' or sh 'npm run build'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                // Add your test commands here
                // For example: sh 'mvn test' or sh 'npm test'
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed'
        }
    }
}