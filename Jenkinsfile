pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        parallel(
          "Build": {
            sh '''echo 'Gerando o pacote'
ls
whoami
pwd
echo ${BUILD_TAG}
'''
            sleep 20
            
          },
          "SCP GoogleCloud": {
            sh '''echo 'Realizando o SCP'
ls
echo ${last_tag}'''
            
          }
        )
      }
    }
    stage('Tests') {
      steps {
        sleep 5
      }
    }
    stage('Aproval') {
      steps {
        input 'Você aprova?'
      }
    }
    stage('Deploy') {
      steps {
        sh 'echo \'deploy\''
      }
    }
  }
}