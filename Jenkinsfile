pipeline{
  agent any
  stages{
    stage('Build'){
      steps{
            withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'personal-aws', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
            sh 'echo building docker image and deploying it to ecr'
            sh "push_image.sh multibranch-lambda
      }

    }
  }
}
