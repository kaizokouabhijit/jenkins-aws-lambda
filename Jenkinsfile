pipeline {
    agent any

    stages 
    {
        stage('Start') {
            steps {
                script
                {
                    def branch = env.GIT_COMMIT
                    sh 'git show --name-only ${branch}'
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
