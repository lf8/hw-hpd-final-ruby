pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        parallel(
          "Build": {
            sh '''echo 'Gerando o pacote'
ls -la
whoami
pwd

/usr/local/bin/fpm -m "Luis Marta, <luistecnologia@gmail.com>" --url "http://firma.org.br" --description "Ruby Final" -a noarch -s dir -t rpm -n rubyfinal --rpm-user root --rpm-group root -v 0.1.${BUILD_NUMBER} --prefix /opt/rubyfinal .
'''
            
          },
          "SCP GoogleCloud": {
            sleep 5
            sh '''echo 'Realizando o SCP'
ls -la
scp rubyfinal-0.1.${BUILD_NUMBER}-1.noarch.rpm jenkins@35.202.45.65:/home/jenkins
'''
            
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