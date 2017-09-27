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
echo ${BUILD_NUMBER}
echo ${GIT_COMMIT}
'''
            sleep 8
            
          },
          "SCP GoogleCloud": {
            sh '''echo 'Realizando o SCP'
ls
echo $last_tag
scp rubyfinal-0.0.9-1.noarch.rpm jenkins@35.202.45.65:/home/jenkins'''
            
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
        input 'VocÃª aprova?'
      }
    }
    stage('Deploy') {
      steps {
        sh 'echo \'deploy\''
      }
    }
    stage('TesteProdução') {
      steps {
        sh 'ssh jenkins@35.202.45.65 "/opt/rubyteste/sinatra-bootstrap/./validaSinatra.py"'
      }
    }
  }
}