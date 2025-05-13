FROM adoptopenjdk/openjdk11:alpine-jre
#AdoptOpenJDK: A community build of the OpenJDK.
#openjdk11: You're using Java 11.

#alpine-jre: A very small Linux distribution with just the Java Runtime (JRE), not the full JDK.

ARG artifacts=target/simple-java-app-1.0-SNAPSHOT.jar

WORKDIR /opt/app

#docker build --build-arg artifact=target/my-app.jar -t myimage .
#can be changed during build 


#Copies the .jar file from your local machine to the container.
COPY ${artifacts} app.jar



# Expose the port your Spring Boot app runs on (default is 8080)
EXPOSE 8080


#defines default commands to run , when container starts 
ENTRYPOINT ["java" , "-jar" , "app.jar"]





