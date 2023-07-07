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
                    // def branch = env.BRANCH_NAME
                    // echo "Branch name: ${branch}"
                    echo "Last commit was: ${lastCommitID}"
                def commitID = env.GIT_COMMIT
                    echo "Current commit is : ${commitID}"
               // def commitList = sh(script: "git log --oneline '${lastCommitID}'~...HEAD | awk '{print \$1}'", returnStdout: true).trim()
                    // def commitList = sh(script: "git show --name-only '${lastCommitID}'~...HEAD | tail -n+2", returnStdout: true).trim()
                    def revlist = sh(script: "git rev-list ${lastCommitID}~...HEAD", returnStdout: true).trim()
                echo "commit ID: ${revlist}"
                    for (commit in revlist)
                    {
                        echo "commit id is ${commit}"
                def commits = sh(script: 'git show --name-only ${commit}', returnStdout: true).trim()
                 def lines = commits.split('\n')
                def lastPart = lines[-1]
                folderName = lastPart.split('/')[0]
                        echo "folder name is : ${folderName}"
                    }

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
