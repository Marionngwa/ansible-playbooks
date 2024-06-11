pipeline {
    agent {
        label 'agent-ansible'
    }
    stages {
        stage('Testing the Agent') {
            steps {
                sh 'ansible all -m ping'
            }
        }
        stage('Transferring files from GitHub to Ansible server') {
            steps {
                sh '''
                    # Clone the repository
                    git clone https://github.com/Marionngwa/ansible-playbooks.git
                    
                    # Change to the cloned repository directory
                    cd ansible-playbooks
                    
                    # Transfer files to the Ansible server
                    scp -r * ec2-user@54.162.22.98:/home/ec2-user/ansible-dev
                '''
            }
        }
    }
}
