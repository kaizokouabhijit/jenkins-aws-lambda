def folderName=""
def buildLambda=[]
def deployLambda=[]

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

                    def commitList = revlist.split('\n')
                    for (commit in commitList)
                    {
                       def commits = sh(script: "git show --name-only ${commit}", returnStdout: true).trim()
                        def lines = commits.split('\n')
                        def lastPart = lines[-1]
                        echo "file path is ${lastPart}"
                        if (lastPart =~ /\.py$|\.java$/)
                        {
                            folderName = lastPart.split('/')[0]
                            if(!buildLambda.contains(folderName))
                            { buildLambda.add(folderName)}
                            
                        }
                        if (lastPart =~/\.yaml$|Jenkinsfile$/)
                        {
                            folderName = lastPart.split('/')[0]
                            if(!deployLambda.contains(folderName))
                            { deployLambda.add(folderName)}
                        }
                       
                    }
                             echo "${deployLambda}"
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
