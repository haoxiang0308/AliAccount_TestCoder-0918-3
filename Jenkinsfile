pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                // Add your build commands here
                sh 'echo "Build stage executed"'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                // Add your test commands here
                sh 'echo "Test stage executed"'
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed'
        }
    }
}