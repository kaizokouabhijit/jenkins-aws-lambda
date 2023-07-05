pipeline {
    agent any
environment {
        
        DEPENDENT_FOLDER = 'jenkins-aws-lambda'
   }
    stages 
    {
        stage('Start') {
            steps {
                sh 'ls'
            }
        }

        stage ('Invoke_pipeline') {
            when {   
	         anyOf {
		       changeset "$DEPENDENT_FOLDER/AWS/**"
            // changeset "$DEPENDENT_FOLDER/DevOps/**"
		     }
		   }
            steps {
                script
                {
                build job: 'inner-pipeline', parameters: [
                string(name: 'param1', value: "value1")
                ]
                }
            }
        }

        stage('End') {
            steps {
                sh 'ls'
            }
        }
    }
}
