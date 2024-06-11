pipeline {
    agent {
        label 'agent-jenkins'
    }
    stages {
        stage('transferring files') {
            steps {
                script {
                    sshPublisher(
                        publishers: [sshPublisherDesc(
                            configName: 'ansible-jenkins',
                            transfers: [sshTransfer(
                                cleanRemote: false,
                                excludes: '',
                                execCommand: 'ls',
                                execTimeout: 120000,
                                flatten: false,
                                makeEmptyDirs: false,
                                noDefaultExcludes: false,
                                patternSeparator: '[, ]+',
                                remoteDirectory: '/home/ec2-user/ansible-dev',
                                remoteDirectorySDF: false,
                                removePrefix: '',
                                sourceFiles: '*'
                            )],
                            usePromotionTimestamp: false,
                            useWorkspaceInPromotion: false,
                            verbose: false
                        )]
                    )
                }
            }
        }
    }
}
