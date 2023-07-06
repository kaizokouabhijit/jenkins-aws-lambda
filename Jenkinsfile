def folderName=""

pipeline {
    agent any

    stages 
    {
        stage('Start') {
            steps
            {
                script
                {
                    def lastCommitID = env.GIT_PREVIOUS_COMMIT
                    echo "Last commit was: ${lastCommitID}"
                def commitID = env.GIT_COMMIT
                    echo "Current commit is : ${commitID}"
                def commits = sh(script: 'git show --name-only ${commitID}', returnStdout: true).trim()
                 def lines = commits.split('\n')
                def lastPart = lines[-1]
                folderName = lastPart.split('/')[0]
                  echo "folder name is : ${folderName}"  
                }

                
                
            }
        }

        stage ('Invoke_pipeline') {
            steps {
               script
                {
                    echo "folder name is : ${folderName}"
                }
            }
        }

        stage('End') {
            steps {
                sh 'ls'
            }
        }
    }
}
