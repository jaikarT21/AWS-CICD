# AWS-CICD
## Java Web Application Deployment on AWS EC2

### Overview
This guide provides a step-by-step approach to developing a Java web application from scratch, setting it up on an AWS EC2 instance, and deploying it using Docker. The process includes:

- Setting up an EC2 instance and installing necessary tools (JDK, Maven, Docker)
- Integrating with Git for version control
- Building the application using Maven
- Testing the application locally
- Dockerizing the application
- Pushing the Docker image to a Docker registry

---

### Prerequisites
- An AWS account with permissions to create and manage EC2 instances
- Basic knowledge of Java, Maven, Git, and Docker
- GitHub account for version control
- Docker Hub account for storing Docker images

---

## Step 1: Launch an EC2 Instance
1. Log in to your AWS Management Console.
2. Navigate to the EC2 Dashboard.
3. Click on **Launch Instance**.
4. Choose an Amazon Machine Image (AMI), preferably **Amazon Linux 2**.
5. Select an instance type (e.g., `t2.micro` for free tier).
6. Configure instance details as needed.
7. Add storage if necessary.
8. Configure security group to allow **SSH (port 22)** and **HTTP (port 80)** access.
9. Review and launch the instance.
10. Download the key pair (`.pem` file) for SSH access.

---

## Step 2: SSH into the EC2 Instance
1. Open a terminal on your local machine.
2. Navigate to the directory containing your `.pem` file.
3. Run the following command to connect:

```bash
chmod 400 your-key.pem
ssh -i your-key.pem ec2-user@your-ec2-public-ip

```
## Step 3: Install JDK, Maven, Docker, and Git


### install JDK

- sudo yum update -y
- sudo amazon-linux-extras install java-openjdk11 -y
- java -version

### Install Maven

- sudo yum install maven -y
- Mvn -version
  
### Install Docker

- sudo yum install docker -y
- sudo service docker start
- sudo usermod -a -G docker ec2-user
- 
# Log out and log back in for the usermod changes to take effect.
Install Git

- sudo yum install git -y
- git --version

## Step 4: Clone the Git Repository
Navigate to your desired directory:


- cd /home/ec2-user
### Clone your repository:

- git clone https://github.com/your-username/your-repo.git
- cd your-repo

## Step 5: Build the Application Using Maven
Ensure you're in the project directory.

Run the Maven build:
- mvn clean install
### Upon successful build, a .jar file will be generated in the target directory.

## Step 6: Test the Application Locally
Run the application:

- java -jar target/your-app.jar
- Access the application by navigating to http://your-ec2-public-ip:8080 in your browser.

## Step 7: Dockerize the Application
Create a Dockerfile in the root of your project:

- docker build -t your-dockerhub-username/your-app-name .

## Step 8: Push the Docker Image to Docker Hub

- docker login
- Push the image:
- docker push your-dockerhub-username/your-app-name

## Step 9: Run the Docker Container
Run the Docker container:


- docker run -d -p 8080:8080 your-dockerhub-username/your-app-name
- Access the application by navigating to http://your-ec2-public-ip:8080 in your browser.

### Additional Notes:
Make sure your application.properties (or application.yml) in Spring Boot isn’t configured to change the port unless you want to map it to a different container port.

If you'd like to deploy the application using AWS ECS or EKS, or integrate with CI/CD pipelines like Jenkins, GitHub Actions, or AWS CodePipeline, let me know and I can provide guidance.



### Key Changes:
- The `Dockerfile` is now configured to expose port 8080 (the default for Spring Boot).
- The rest of the steps explain how to SSH into the EC2 instance, install dependencies, and deploy the app using Maven and Docker.










