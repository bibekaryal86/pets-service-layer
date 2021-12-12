FROM adoptopenjdk/openjdk11:alpine
RUN addgroup -S springdocker && adduser -S springdocker -G springdocker
USER springdocker:springdocker
ARG JAR_FILE=app/build/libs/pets-service.jar
COPY ${JAR_FILE} pets-service.jar
ENTRYPOINT ["java","-jar", \
#"-Dspring.profiles.active=docker", \
#"-DBASIC_AUTH_USR=some_username", \
#"-DBASIC_AUTH_PWD=some_password", \
#"-DBASIC_AUTH_USR_PETSDATABASE=another_username", \
#"-DBASIC_AUTH_PWD_PETSDATABASE=another_password", \
"/pets-service.jar"]
# provide environment variables in docker-compose
