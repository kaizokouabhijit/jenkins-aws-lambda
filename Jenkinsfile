pipeline {
    agent any

    stages 
    {
        stage('Start') {
            steps {
                script
                {
                    def branch = env.GIT_COMMIT
                    sh 'git show --name-only 8c041f66b36cdb5d7706652f9978e2d028832949'
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
