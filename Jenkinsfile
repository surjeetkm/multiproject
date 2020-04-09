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
  	
  	stage("Build department image"){
       		dir ('department-service') {
    			app=docker.build("microservices-2020/department-service:latest")
    			docker.withRegistry('https://eu.gcr.io', 'gcr:myregistry') {
 	 			app.push("${env.BUILD_NUMBER}")
 	 			app.push("latest")
        		}
        	}
     }
     stage("employee docker image"){
         	dir ('employee-service') {
    			app=docker.build("microservices-2020/employee-service:latest")
    			docker.withRegistry('https://eu.gcr.io', 'gcr:myregistry') {
 	 			app.push("${env.BUILD_NUMBER}")
 	 			app.push("latest")
        		}
       	 }
     }
      
      stage("Organization docker image"){
         	dir ('organization-service') {
    			app=docker.build("microservices-2020/organization-service:latest")
    			docker.withRegistry('https://eu.gcr.io', 'gcr:myregistry') {
 	 			app.push("${env.BUILD_NUMBER}")
 	 			app.push("latest")
        		}
        	}
        }
        
      stage("dicovery image"){
         	dir ('discovery-service') {
    			app=docker.build("microservices-2020/discovery-service:latest")
    			docker.withRegistry('https://eu.gcr.io', 'gcr:myregistry') {
 	 			app.push("${env.BUILD_NUMBER}")
 	 			app.push("latest")
        		}
           }
        }
        stage("Proxy image"){
         	dir ('proxy-service') {
    			app=docker.build("microservices-2020/proxy-service:latest")
    			docker.withRegistry('https://eu.gcr.io', 'gcr:myregistry') {
 	 			app.push("${env.BUILD_NUMBER}")
 	 			app.push("latest")
        		}
        	}
        }
        stage("Gateway service"){
         	dir ('gateway-service') {
    			app=docker.build("microservices-2020/gateway-service:latest")
    			docker.withRegistry('https://eu.gcr.io', 'gcr:myregistry') {
 	 			app.push("${env.BUILD_NUMBER}")
 	 			app.push("latest")
    	    	}
	    	}
		 }
      
}