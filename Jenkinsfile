def folderName=""
def buildLambda=[]
def deployLambda=[]
def folder = ""

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
                             echo "All values in buildLambda are: ${buildLambda}"
                }

                
                
            }
        }

        stage ('Invoke_pipeline') {
            steps {
               script
                {
                   if (buildLambda.size()>0)
                    {
                        folder = buildLambda[0]
                        echo "first folder in buildLambda is : ${folder}"
                    }
                }
            }
        }

        stage('End') {
            steps {
                sh 'ls'
            }
        }
    }
    post {
        success {
            script {
                buildLambda.remove(0)
                if (buildLambda.size()>0)
                { echo "from post action, buildLmabda: ${buildLambda}" 
                    build 'multi-config-pipeline-personal'}
            }
        }
    }
}
