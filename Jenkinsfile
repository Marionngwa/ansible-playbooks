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
                    
                    # Add the EC2 instance's SSH host key to known_hosts
                    ssh-keyscan -H 54.162.22.98 >> ~/.ssh/known_hosts
                    
                    # Transfer files to the Ansible server using the specified private key
                    scp -i /home/ec2-user/ansible-key.pem -r * ec2-user@54.162.22.98:/home/ec2-user/ansible-dev
                '''
            }
        }
    }
}
