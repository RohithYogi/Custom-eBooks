pipeline {
	environment {
    registry = "arunaav/customebooks"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Clean Target Files') {
      steps {
        sh 'mvn clean'
      }
    }

    stage('Compile and create WAR File') {
      steps {
        sh 'mvn package'
      }
    }

}
