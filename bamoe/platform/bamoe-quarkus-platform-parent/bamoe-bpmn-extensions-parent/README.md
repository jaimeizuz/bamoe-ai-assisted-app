# process-paas-bamoe-bpmn-extensions-parent Java Library

## Description
Maven Parent POM para la gestión centralizada de las dependencias utilizadas para la creación de librerías personalizadas de extensiones de BAMOE BPMN, tales como:
- Custom Event Listener
- Custom User Task Lifecycle
- Custom REST endpoints


## Instrucciones de uso
- En el proyecto destino, añadir este POM como Parent, tal y como se muestra en el siguiente ejemplo:
```
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
	<parent>
		<groupId>org.jaime.bamoe</groupId>
		<artifactId>process-paas-bamoe-bpmn-extensions-parent</artifactId>
		<version>1.0.0</version>
		<relativePath/>
	</parent>
	<modelVersion>4.0.0</modelVersion>
	<groupId>org.jaime.bamoe</groupId>
	<artifactId>process-paas-engine-controller</artifactId>
	<version>1.9.0-SNAPSHOT</version>
	<packaging>jar</packaging>
```

- Las dependencias incluidas dentro del nodo `<dependencies>` contenidos en este Parent POM no deben ser incluidos como dependencias en los proyectos hijo, ya que están implícitamente incluidas.

- Las dependencias incluidas dentro del nodo `<dependencyManagement>` del BOM raíz, que es Parent de este proyecto, no deben definir nodo `<version>` en los proyectos hijo, ya que es el propio BOM el que gobierna y define las versiones, quedando de esa manera alineadas con la versión de la plataforma Quarkus que se utilizará en el runtime final:
```
        <dependency>
            <groupId>io.quarkus</groupId>
            <artifactId>quarkus-agroal</artifactId>
        </dependency>

        <dependency>
            <groupId>io.quarkus</groupId>
            <artifactId>quarkus-jdbc-postgresql</artifactId>
        </dependency>

        <dependency>
            <groupId>org.apache.commons</groupId>
            <artifactId>commons-lang3</artifactId>
        </dependency>

        <dependency>
            <groupId>commons-validator</groupId>
            <artifactId>commons-validator</artifactId>
        </dependency>

        <dependency>
            <groupId>io.quarkus</groupId>
            <artifactId>quarkus-smallrye-openapi</artifactId>
        </dependency>

        <dependency>
            <groupId>jakarta.validation</groupId>
            <artifactId>jakarta.validation-api</artifactId>
        </dependency>

        <dependency>
            <groupId>io.quarkus</groupId>
            <artifactId>quarkus-scheduler</artifactId>
        </dependency>

        <dependency>
            <groupId>io.quarkus</groupId>
            <artifactId>quarkus-rest</artifactId>
        </dependency>

        <dependency>
            <groupId>io.quarkus</groupId>
            <artifactId>quarkus-rest-jackson</artifactId>
        </dependency>

        <dependency>
            <groupId>io.quarkus</groupId>
            <artifactId>quarkus-rest-client-jackson</artifactId>
        </dependency>
         ....
```