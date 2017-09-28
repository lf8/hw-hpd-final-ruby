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
env

/usr/local/bin/fpm -m "Luis Marta, <luistecnologia@gmail.com>" --url "http://firma.org.br" --description "Ruby Final" -a noarch -s dir -t rpm -n rubyfinal --rpm-user root --rpm-group root -v 0.1.${BUILD_NUMBER} --prefix /opt/rubyfinal .
'''
            sleep 8
            
          },
          "SCP GoogleCloud": {
            sh '''echo 'Realizando o SCP'
ls
echo $last_tag
env
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