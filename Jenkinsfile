pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh '''echo 'build'
ls'''
      }
    }
    stage('Tests') {
      steps {
        sleep 5
      }
    }
    stage('Aproval') {
      steps {
        input 'Voc� aprova?'
      }
    }
    stage('Deploy') {
      steps {
        sh 'echo \'deploy\''
      }
    }
  }
}