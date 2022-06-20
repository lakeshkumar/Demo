FROM openjdk:11
ADD target/Demo-0.0.1-SNAPSHOT.jar Demo-0.0.1-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","Demo-0.0.1-SNAPSHOT.jar"]