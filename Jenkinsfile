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
        stage('zip files and transfer them to my jfrog'){
            steps{
                sh '''
                  zip my-playbooks.zip *
                  curl -uadmin:AP6APkHxetchhfhHqpaawMctMhu \
                 -T my-playbooks.zip \
                 "http://ec2-100-25-143-148.compute-1.amazonaws.com:8081/artifactory/yaml-files/"
                '''
            }
        }
        
    }
}
