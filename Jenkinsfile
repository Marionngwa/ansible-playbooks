pipeline {
    agent any
    stages {
        // stage('Cloning files from GitHub repository') {
        //     steps {
        //         sh 'git clone https://github.com/Marionngwa/ansible-playbooks.git'
        //     }
        // }
        
        stage('Transfer the cloned files to the Ansible server') {
            steps {
                script {
                    sshPublisher(publishers: [
                        sshPublisherDesc(
                            configName: 'ansible-server', 
                            transfers: [
                                sshTransfer(
                                    sourceFiles: '**/*.yml,**/*.cfg', 
                                    remoteDirectory: '/home/ec2-user/ansible-dev', // Remote base directory
                                    execCommand: 'cd /home/ec2-user/ansible-dev && ansible-playbook dir.yml', 
                                    execTimeout: 120000, 
                                    flatten: false, 
                                    makeEmptyDirs: false, 
                                    noDefaultExcludes: false, 
                                    patternSeparator: '[, ]+', 
                                    removePrefix: '' 
                                )
                            ],
                            usePromotionTimestamp: false, 
                            useWorkspaceInPromotion: false, 
                            verbose: false 
                        )
                    ])
                }
            }
        }
    }
}
