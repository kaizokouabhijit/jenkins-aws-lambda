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
                    echo "Last commit was: ${lastCommitID}"
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
                def rootDir = pwd()
    def exampleModule = load "${rootDir}@script/Jenkinsfile"
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
