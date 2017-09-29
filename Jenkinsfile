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
          "BuildandoParaTeste": {
            sleep 5
            sh '''echo 'Subindo aplicação no Docker para teste'
ls -l
docker build -t ruby-stage .'''
            
          }
        )
      }
    }
    stage('Tests') {
      steps {
        parallel(
          "Tests": {
            sleep 5
            sh '''echo 'Gerando e subindo imagem'
ls -l
docker run -it -p 4567:4567 ruby-stage'''
            
          },
          "TestAPPLocal": {
            sh '''ls -la
./validaSinatra.py'''
            
          }
        )
      }
    }
    stage('Aproval') {
      steps {
        input 'Aprova para Deploy?'
      }
    }
    stage('Deploy') {
      steps {
        sh '''echo 'deploy'
ssh jenkins@35.202.45.65 "sudo rpm -e rubyfinal"
ssh jenkins@35.202.45.65 "scl enable rh-ruby22 bash"
ssh jenkins@35.202.45.65 "sudo rpm -ivh rubyfinal-0.0.${BUILD_NUMBER}-1.noarch.rpm"
ssh jenkins@35.202.45.65 "bundle install"
ssh jenkins@35.202.45.65 "bundle exec ruby application.rb"'''
      }
    }
    stage('TesteProducao') {
      steps {
        sh 'ls -la'
      }
    }
  }
}