pipeline {
    agent any
environment {
        
        AWS_FOLDER = 'jenkins-aws-lambda/AWS'
	DEVOPS_FOLDER = 'jenkins-aws-lambda/DevOps'
	
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
		       changeset "$AWS_FOLDER/**"
            changeset "$DEVOPS_FOLDER/**"
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
