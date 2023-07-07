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
                    // def commitList = sh(script: "echo \$(git log -3)", returnStdout: true)
                   
                    // def lines = commitList.split(' ')
                     echo "here"
                    // def firstPart = lines[0]
                    // echo "Now here :${firstPart}"
                    def lastCommitID = env.GIT_PREVIOUS_COMMIT
                    echo "Last commit was: ${lastCommitID}"
                def commitID = env.GIT_COMMIT
                    echo "Current commit is : ${commitID}"
                    // def commits = sh "git rev-parse ${lastCommitID}..HEAD"
               def commitList = sh(script: "echo \$(git log --oneline ${lastCommitID}~...HEAD)", returnStdout: false)
                //  def lines = commits.split('\n')
                // def lastPart = lines[-1]
                // folderName = lastPart.split('/')[0]
                 echo "commit ID : ${commitList}"
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
