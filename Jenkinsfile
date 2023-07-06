pipeline {
    agent any

    stages 
    {
        stage('Start') {
            steps {
                script
                {
                    def commitID = env.GIT_COMMIT
                    def commits = sh 'git show --stat --oneline ${commitID}'
                    def fileName = commits =~ /(\S+)\s\|\s\d+\s[+-]/[0][1]
                    echo '${fileName}'

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
