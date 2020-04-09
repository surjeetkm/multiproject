node{
	stage("Git clone"){
		git credentialsId: 'GITHUB_CREDENTIALS', url: 'https://github.com/surjeetkm/multiproject.git'
	}
	stage("Maven clean build artifact"){	
		def mavenHome= tool name: "Maven", type: "maven"
		def command= "${mavenHome}/bin/mvn"
		sh "${command} clean install"
	}
	stage("Run Junit and Integration Test cases"){}
	stage('Config-service image') {
   	 	dir ('config-service') {
    			app=docker.build("microservices-2020/config-service:latest")
    			docker.withRegistry('https://eu.gcr.io', 'gcr:myregistry') {
 	 			app.push("${env.BUILD_NUMBER}")
 	 			app.push("latest")
        		}
  		}
  	}
}