pipeline {
    agent any

    stages 
    {
        stage('Start') {
            steps
            {
                script
                {
                def commitID = env.GIT_COMMIT
                def commits = sh(script: 'git show --name-only ${commitID}', returnStdout: true).trim()
                    for (commit in commits)
                    {
                        def lines = commit.split('\n')
                        def lastPart = lines[-1]
                        echo "The filename is : ${lastPart}"
                    }
                // def lines = commits.split('\n')
                // def lastPart = lines[-1]
                //     echo "The filename is : ${lastPart}"
                }

                
                
            }
        }

        stage ('Invoke_pipeline') {
            steps {
                build job: 'inner-pipeline', parameters: [
                string(name: 'param1', value: "value1")
                ]
            }
        }

        stage('End') {
            steps {
                sh 'ls'
            }
        }
    }
}
