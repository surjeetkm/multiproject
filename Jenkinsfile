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
	
	stage("Build docker image"){
		
      dir ('config-service') {
    		app=docker.build("microservices-2020/config-service:latest")
        }
    }
}