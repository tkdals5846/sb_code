FROM openjdk:8-alpine
ADD target/springbootApp.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]