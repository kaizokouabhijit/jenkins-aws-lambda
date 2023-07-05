pipeline {
    agent any

    stages 
    {
        stage('Start') {
            steps {
                script
                {
                    def branch = env.GIT_COMMIT
                    echo "commit ID is : ${branch}"
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
