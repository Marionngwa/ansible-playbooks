pipeline {
    agent {
        label 'agent-ansible'
    }
    stages {
        stage('Testing the Agent') {
            steps {
                sh 'ansible --version'
            }
        }
    }
}
