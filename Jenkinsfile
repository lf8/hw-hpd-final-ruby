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
            sleep 2
            sh '''echo 'Subindo app no Docker para teste'
ls -l
docker build -t ruby-stage:latest .'''
            
          }
        )
      }
    }
    stage('Tests') {
      steps {
        parallel(
          "Tests": {
            sh '''echo 'Gerando e subindo imagem'
ls -l
docker run -d -p 4567:4567 ruby-stage:latest'''
            
          },
          "TestAPPLocal": {
            sleep 5
            sh '''ls -la
chmod +x validaapp.py
./validaapp.py'''
            
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
ssh jenkins@35.202.45.65 "[ -f /opt/rubyfinal/README.md ] && sudo rpm -e rubyfinal || echo 'File does not exist'"
scp rubyfinal-0.1.${BUILD_NUMBER}-1.noarch.rpm jenkins@35.202.45.65:/home/jenkins
ssh jenkins@35.202.45.65 "sudo rpm -ivh rubyfinal-0.1.${BUILD_NUMBER}-1.noarch.rpm"
ssh jenkins@35.202.45.65 "/opt/rubyfinal/./upapp.sh"'''
      }
    }
    stage('TesteProducao') {
      steps {
        sh 'ls -la'
      }
    }
  }
}