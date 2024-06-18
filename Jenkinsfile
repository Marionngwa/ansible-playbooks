pipeline {
    agent any
    stages {
        stage('Transfer files'){
            steps{
                sshPublisher(
                    publishers: [
                        sshPublisherDesc(
                            configName: 'agent-ansible', 
                            transfers: [
                            sshTransfer(
                                cleanRemote: true, 
                                excludes: '', 
                                execCommand: 'ls', 
                                execTimeout: 120000, 
                                flatten: false, 
                                makeEmptyDirs: false, 
                                noDefaultExcludes: false, 
                                patternSeparator: '[, ]+', 
                                remoteDirectory: '', 
                                remoteDirectorySDF: false, 
                                removePrefix: '', 
                                sourceFiles: '**/*.yml,**/*.cfg')], 
                                usePromotionTimestamp: false, 
                                useWorkspaceInPromotion: false, verbose: false)])
            }
        }
        
        
    }
}
