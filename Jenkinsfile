pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh '''echo 'Gerando o pacote'
ls
whoami
pwd
fpm'''
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