FROM openjdk:8
EXPOSE 8080
ADD target/proxy-service.jar proxy-service.jar
ENTRYPOINT ["java","-jar","proxy-service.jar"]