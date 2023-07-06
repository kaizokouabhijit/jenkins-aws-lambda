pipeline {
    agent any

    stages 
    {
        stage('Start') {
            steps {
                def commitID = env.GIT_COMMIT
                def output = sh(script: 'git show --name-only ${commitID}', returnStdout: true).trim()
                def lines = output.split('\n')
                def lastPart = lines[-1]

// println lastPart

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
