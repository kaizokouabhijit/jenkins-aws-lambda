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
                    sh "git log -3"
                    def lastCommitID = env.GIT_PREVIOUS_COMMIT
                    echo "Last commit was: ${lastCommitID}"
                def commitID = env.GIT_COMMIT
                    echo "Current commit is : ${commitID}"
                    // def commits = sh "git rev-parse ${lastCommitID}..HEAD"
                def commits = sh(script: "echo \$(git rev-parse ${lastCommitID}...HEAD)", returnStdout: true).trim()
                //  def lines = commits.split('\n')
                // def lastPart = lines[-1]
                // folderName = lastPart.split('/')[0]
                 echo "commit ID : ${commits}"
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
