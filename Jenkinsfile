pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh '''echo 'Gerando o pacote'
ls
fpm -m "Luis Marta, <luistecnologia@gmail.com>" --url "http://firma.org.br" --description "Ruby Final" -a noarch -s dir -t rpm -n rubyfinal --rpm-user root --rpm-group root -v $last_tag --prefix /opt/rubyfinal .'''
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