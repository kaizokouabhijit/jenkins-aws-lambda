pipeline {
    agent any

    stages 
    {
        stage('Start') {
            steps {
                script
                {
                    def branch = env.GIT_COMMIT
                    def output = sh(script: 'git show --name-only ${branch}', returnStdout: true).trim()
                    def lines = output.split('\n')
                    for (line in lines)
                    {
                        def lastPart = line[-1]
                        echo "${lastPart}"
                    }

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
