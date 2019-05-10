FROM openjdk:8-jdk-alpine

# VOLUME /tmp
#ARG JAR_FILE_NAME
COPY target/handy-resourhandy-eureka-service.jar app.jar
COPY apm/elastic-apm-agent-1.4.0.jar elastic-apm-agent.jar
COPY apm/elasticapm.properties elasticapm.properties
WORKDIR /run_data
COPY target/classes/scripts .
ENTRYPOINT ["java","-javaagent:/elastic-apm-agent.jar","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
