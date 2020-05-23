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
        sh 'mvn clean '
      }
    }

    stage('Building Class Files') {
      steps {
        sh 'mvn install'
      }
    }

 stage('DockerHub') {
      stages{
        stage('DockerHub Build Image') {
          steps{
            script {
              dockerImage = docker.build registry + ":$BUILD_NUMBER"
            }
          }
        }
        stage('DockerHub Push Image') {
          steps{
            script {
              docker.withRegistry( '', registryCredential ) {
                dockerImage.push()
								pushLatestBuild = "docker push "+registry
								sh pushLatestBuild
              }
            }
          }
        }
      }
    }
/*
		Job Id to update both the Web App and Database container : 382dd188-788c-4dd3-913b-d68437498c69
		Job Id only to update the Web App container only: 7e706023-c5ba-44e5-b3a0-1b26087507ac
		Job Id to update on the Database Container only: 08157783-2818-42ee-b118-b21670fdf037
*/

stage('Rundeck Deploy') {
      agent any
      steps {
        script {
          step([$class: "RundeckNotifier",
          rundeckInstance: "Rundeck",
          options: """
            BUILD_VERSION=$BUILD_NUMBER
          """,
          jobId: "382dd188-788c-4dd3-913b-d68437498c69"])
        }
      }
    }
  }
}
