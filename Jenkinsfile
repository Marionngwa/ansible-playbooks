pipeline {
    agent any
    
    stages {
        stage('Fetch from GitHub') {
            steps {
                // Clone the repository from GitHub
                git 'https://github.com/Marionngwa/ansible-playbooks.git'
            }
        }
        stage('Transfer to Ansible Server') {
            steps {
                // Use SSH key to transfer files to the Ansible server
                script {
                    def remoteDir = '/home/ec2-user/ansible-dev'
                    def ansibleServer = [:]
                    ansibleServer['host'] = '3.81.212.155'
                    ansibleServer['user'] = 'ec2-user'
                    ansibleServer['port'] = 22 // Or any other port you are using for SSH
                    ansibleServer['key'] = readFile('/home/ec2-user/ansible-key.pem').trim()
                    
                    // Transfer files using scp with SSH key
                    sshCommand remote: ansibleServer, command: "scp -r -i /tmp/id_rsa ./* ${ansibleServer['user']}@${ansibleServer['host']}:${remoteDir}"
                }
            }
        }
    }
}
