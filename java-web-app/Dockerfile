#lpine Linux is a small and lightweight Linux distribution, which makes the image size much smaller than other base images. This image is useful for minimizing the final image size of Java applications. 

FROM eclipse-temurin:17-jdk-alpine


ARG artifacts=target/java-web-app-1.0.0.jar  

WORKDIR /opt/app

#docker build --build-arg artifact=target/my-app.jar -t myimage .
#can be changed during build 


#Copies the .jar file from your local machine to the container.
COPY ${artifacts} app.jar



# Expose the port your Spring Boot app runs on (default is 8080)
EXPOSE 8080


#defines default commands to run , when container starts 
ENTRYPOINT ["java" , "-jar" , "app.jar"]

