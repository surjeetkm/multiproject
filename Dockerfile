FROM openjdk:8-jre-alpine
ENV APP_FILE config-service-1.0-SNAPSHOT.jar
ENV APP_HOME /app
EXPOSE 8088
COPY target/$APP_FILE $APP_HOME/
WORKDIR $APP_HOME
ENTRYPOINT ["sh", "-c"]
CMD ["exec java -jar $APP_FILE"]

FROM openjdk:8
EXPOSE 8080
ADD target/kubernetes-microservice.jar kubernetes-microservice.jar
ENTRYPOINT ["java","-jar","kubernetes-microservice.jar"]