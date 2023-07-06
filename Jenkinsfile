pipeline {
    agent any

    stages 
    {
        stage('Start') {
            steps {
               script {
         PARAMS = sh (
        script: 'git log --name-only --oneline ${commitID}',
        returnStdout: true
    ).trim()
}
                sh "echo ${PARAMS}"
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
