pipeline {
	agent any
	tools {
		maven "Maven"
	}
	stages {
		stage('Compile and Clean') {
			steps {
				sh "mvn clean"
			}
		}
		stage('deploy') {
			steps {
				sh "mvn install"
			}
		}
		stage('Build Docker image') {
			steps {
				echo "Hello Java Express"
				sh 'ls'
				sh 'docker build -t lakeshkumar/docker_jenkins_springboot:${BUILD_NUMBER}.'
			}
		}
		stage('Docker Login') {
			steps {
				withCredentials([string(credentialsId: 'DockerId', variable: 'Dockerpwd')]) {
				sh "docker login -u lakeshkumar -p ${Dockerpwd}"
				}
			}
		}
		stage('Docker Push') {
			steps {
				sh 'docker push lakeshkumar/docker_jenkins_springboot:${BUILD_NUMBER}'
			}
		}
		stage('Docker deploy') {
			steps {
				sh 'docker run -itd -p 8081:8080 lakeshkumar/docker_jenkins_springboot:${BUILD_NUMBER}'
			}
		}
		stage('Archving') {
			steps {
				archiveArtifacts '**/target/*.jar'
			}
		}
	}
}