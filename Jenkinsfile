pipeline {
    agent any
environment {
        
        AWS_FOLDER = 'jenkins-aws-lambda'
	DEVOPS_FOLDER = 'jenkins-aws-lambda'
	
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
		    beforeAgent true
	         anyOf {
		       changeset "$AWS_FOLDER/**"
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
