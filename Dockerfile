# Use Java 25 runtime
FROM eclipse-temurin:25-jre

# Create a working directory inside the container
WORKDIR /app

# Copy the built jar from the target folder into the image
# The wildcard lets this work even if your jar name changes
COPY target/wms-app.jar app.jar

# Expose the port your Spring Boot app uses
EXPOSE 8080

# Start the app
ENTRYPOINT ["java","-jar","/app/app.jar"]
