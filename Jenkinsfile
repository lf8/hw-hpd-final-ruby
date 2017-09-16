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
/usr/local/bin/fpm -m "Luis Marta, <luistecnologia@gmail.com>" --url "http://firma.org.br" --description "Ruby Final" -a noarch -s dir -t rpm -n rubyfinal --rpm-user root --rpm-group root -v 0.0.9 --prefix /opt/rubyfinal .'''
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