FROM maven:3-openjdk-8 AS test
WORKDIR /test
COPY . .
RUN mvn clean package


FROM tomcat:9 
COPY --from=test /test/target/*.war /usr/local/tomcat/webapps
