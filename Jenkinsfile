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
                    // def lastPart = lines[-1]
                    sh "echo ${lines}"
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
