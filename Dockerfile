FROM tomcat:8.5.50-jdk8-openjdk

ARG WAR_FILE
ARG CONTEXT

# COPY target/tasks-backend.war /usr/local/tomcat/webapps/tasks-backend.war

# para criar imagens do Backend e Frontend
COPY ${WAR_FILE} /usr/local/tomcat/webapps/${CONTEXT}.war


# 1 Dockerfile
# 2 Build: cria a imagem
# > docker build --build-arg WAR_FILE=frontend/target/tasks.war --build-arg CONTEXT=tasks -t test-front .
# > docker run --rm --name teste -p 8003:8080 test-front 