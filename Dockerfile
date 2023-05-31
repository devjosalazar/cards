# Imagen base con Maven y Java 11 instalados
FROM openjdk:17-alpine

# Establecer el directorio de trabajo en la carpeta del proyecto
WORKDIR /cards
# Copiar el código fuente de Accounts al contenedor
COPY  ./target/cards-0.0.1-SNAPSHOT.jar .

# Variables de entorno requeridas para Accounts
ENV SPRING_PROFILES_ACTIVE dev
ENV SPRING_CONFIG_IMPORT configserver:http://configserver:8071/
ENV EUREKA_CLIENT_SERVICEURL_DEFAULTZONE http://eurekaserver:8070/eureka/

# Comando para ejecutar Accounts cuando se inicie el contenedor
ENTRYPOINT ["java", "-jar", "cards-0.0.1-SNAPSHOT.jar"]
