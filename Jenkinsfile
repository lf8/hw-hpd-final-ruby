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
            sh '''echo 'Efetuando instala��o do Pacote para teste'
ls -l
sudo rpm -e rubyfinal
sudo rpm -ivh rubyfinal-0.0.${BUILD_NUMBER}-1.noarch.rpm'''
            
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
docker build -t ruby-stage .
docker run -it -p 4567:4567 ruby-stage'''
            
          },
          "TestAPPviaSSH": {
            sh '''ls -la
'''
            
          }
        )
      }
    }
    stage('Aproval') {
      steps {
        input 'VocÃƒÂª aprova?'
      }
    }
    stage('Deploy') {
      steps {
        sh '''echo 'deploy'
sudo rpm -e rubyfinal
scl enable rh-ruby22 bash
sudo rpm -ivh rubyfinal-0.0.${BUILD_NUMBER}-1.noarch.rpm
bundle install
bundle exec ruby application.rb'''
      }
    }
    stage('TesteProducao') {
      steps {
        sh '''sudo rpm -e rubyfinal
scl enable rh-ruby22 bash
sudo rpm -ivh rubyfinal-0.0.${BUILD_NUMBER}-1.noarch.rpm
bundle install
bundle exec ruby application.rb'''
      }
    }
  }
}