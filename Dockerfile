# Use maven:3.5.3-jdk-8-alpine as the base image
FROM maven:3.5.3-jdk-8-alpine

# Set the working directory
WORKDIR /app

# Copy the pom.xml and source files
COPY pom.xml ./
COPY src ./src

# Build the project
RUN mvn clean install -DskipTests

# Set the entrypoint to run the built JAR file
ENTRYPOINT ["java", "-jar", "/app/target/flightreservation-0.0.1-SNAPSHOT.jar"]
