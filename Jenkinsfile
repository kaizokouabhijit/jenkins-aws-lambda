def folderName = ""
def buildLambdaJava = []
def buildLambdaPython = []
def isJavaCode = false
def folder = ""

pipeline {
    agent any

    stages 
    {
        stage("Start") {
            steps
            {
                script
                {

                def lastCommitID = env.GIT_PREVIOUS_COMMIT
                def revlist = sh(script: "git rev-list ${lastCommitID}~...HEAD", returnStdout: true).trim()
                def commitList = revlist.split("\n")

                  for (commit in commitList)
                    {
                       def commits = sh(script: "git show --name-only ${commit}", returnStdout: true).trim()
                        def lines = commits.split("\n")
                        def lastPart = lines[-1]
                        echo "file path is ${lastPart}"
                        if (lastPart =~ /\.py$/)
                        {
                            folderName = lastPart.split("/")[0]
                            if(!buildLambdaPython.contains(folderName))
                            { buildLambdaPython.add(folderName)}
                            
                        }
                        if (lastPart =~/\.java$/)
                        {
                            folderName = lastPart.split("/")[0]
                            if(!buildLambdaJava.contains(folderName))
                            { buildLambdaJava.add(folderName)}
                        }
                       
                    }
                    
                }

                
                
            }
        }


        stage ("Build")
        {
            steps {            
            script
                {
              if (buildLambdaPython.size()>0)
              {
                    folder = buildLambdaPython[0]
                    buildImagePython(folder)
              }
              else if (buildLambdaPython.size() == 0 && buildLambdaJava.size()>0)
              {
                folder = buildLambdaJava[0]
                buildImageJava(folder)
              }
              
            }        
        }
        }

        stage("Test") {
            steps {
                sh "ls"
            }
        }


        stage("Deploy")
        {
        steps {
            script
            {

                    readParams(folder)
                    deployLambda(folder)
                
                
            }
            }
        }
    
}

    post {
        success {
            script {

                if (buildLambdaPython.size()>1)
                {
                    buildLambdaPython.remove(0)
                    build "multi-config-pipeline-personal"
                }
                else 
                {
                    if (buildLambdaJava.size()>1)
                    {
                        buildLambdaJava.remove(0)
                        build "multi-config-pipeline-personal"
                    }
                }
            }
        }
    }
}

def buildImageJava(directory)
{
            withCredentials([[$class: "AmazonWebServicesCredentialsBinding", accessKeyVariable: "AWS_ACCESS_KEY_ID", credentialsId: "ontarget-aws", secretKeyVariable: "AWS_SECRET_ACCESS_KEY"]]) {
            sh "echo building jar"
            sh "chmod 777 ${directory}/gradlew"
            sh "${directory}/gradlew -p ${directory} build"
            sh "chmod 777 ${directory}/build/*"
            sh "${directory}/docker_tag_push_image.sh ${directory} ${env.BUILD_NUMBER}"
                  }
}
def buildImagePython(directory)
{
            withCredentials([[$class: "AmazonWebServicesCredentialsBinding", accessKeyVariable: "AWS_ACCESS_KEY_ID", credentialsId: "ontarget-aws", secretKeyVariable: "AWS_SECRET_ACCESS_KEY"]]) {
            sh "echo building docker image and deploying it to ecr"
            sh "chmod 777 ${directory}/docker_tag_push_image.sh"
            sh "${directory}/docker_tag_push_image.sh ${directory} ${env.BUILD_NUMBER} ${REGION}"
                }
}

def readParams(directory)
{

         PARAMS = sh (
        script: "echo \$(cat "${directory}"/deployment_param_config)",
        returnStdout: true
    ).trim()

}

def deployLambda(directory)
{
                   withCredentials([[$class: "AmazonWebServicesCredentialsBinding", accessKeyVariable: "AWS_ACCESS_KEY_ID", credentialsId: "ontarget-aws", secretKeyVariable: "AWS_SECRET_ACCESS_KEY"]]) {
                sh "aws --region ${REGION} cloudformation deploy --template-file ${directory}/cloudformation.yaml  --stack-name ot-${ENV}-${directory} --tags ontarget=${directory} --parameter-overrides ${PARAMS} TAG=${env.BUILD_NUMBER} ENV=${ENV} AUTHPWD=${AUTHPWD} --no-fail-on-empty-changeset --capabilities CAPABILITY_NAMED_IAM"
              }
}
