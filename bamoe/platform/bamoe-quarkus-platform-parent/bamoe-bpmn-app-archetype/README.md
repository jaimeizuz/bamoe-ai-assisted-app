# Darwin Spring Boot sgt-apm1952-bamoearqtype Library

## Features

### Description

Library sgt-apm1952-bamoearqtype generated from the Maven archetype for Darwin Spring Boot libraries.

The Maven archetype for Darwin Spring Boot libraries allows the quick creation of a 'skeleton' for Spring Boot libraries incorporating the necessary dependencies for their use.
This, using the Darwin Spring Boot Starter parent, means that you don't need to worry about which version of the library you are going to use, nor do you need to provide a list of all available dependencies.

!!! note

    For more information on how to generate a microservice from the Darwin archetype, please refer to the following link: [Darwin Spring Boot Archetype Microservice](https://gluon.dev.corp/microservices/docs/darwin-spring-boot/current/darwin-archetypes/darwin-spring-boot-archetype-microservice/index.html)

## Functionalities

The sgt-apm1952-bamoearqtype library exposes a Bean with name `HelloWorldBean` and method `sayHelloProperty` that returns a literal with the value entered in the properties file.
a literal with the value entered in the property file.

In addition, the library includes a __spring.factories__ file where the configuration classes to be loaded when the library is included in an application are specified.

## Installation and configuration

To add the library to any project you will need to include the maven dependency in the `pom.xml` file:

    <dependency>
        <groupId>com.santander.apm1952</groupId>
        <artifactId>sgt-apm1952-bamoearqtype</artifactId>
    </dependency>

### Basic configuration

For this library, no additional configuration is required.

## Exposed API

| Name            | Type                | Description                                                                                                     |
|-----------------|---------------------|-----------------------------------------------------------------------------------------------------------------|
| HelloWorldBean  | Bean - HelloWorld   | Class of type HelloWorld to return the value specified in the properties of the application using the library.  |

## Using the library

To test the functionality of the library, we must first install it in the Maven repository.
To do this we run the command from the library directory :

    mvn clean install

Once installed, and already in the application where we want to make use of the library, we add the dependency in the file `pom.xml`:

    <dependencies>
        <dependency>
            <groupId>com.santander.apm1952</groupId>
            <artifactId>sgt-apm1952-bamoearqtype</artifactId>
            <version>1.0.0-SNAPSHOT</version>
        </dependency>
    </dependencies>

The library property to configure the HelloWorldBean message is configured by default in the `HelloWorldConfigProperties` class, but the project can add a property file and specify the desired value.
`HelloWorldConfigProperties`, but the project can add a properties file and specify the desired value.
In this case we add in the `application.yml` properties file the value:

    sgt-apm1952-bamoearqtype.helloValue: HellofromApplicationYml

At the configuration level, we would have everything ready.
To make use of the library, we inject the Bean dependencies through the constructor:


    public class HelloController {
        private HelloWorldBean helloWorldBean;

        public HelloController (HelloWorldBean helloWorldBean){
            this.helloWorldBean = helloWorldBean;
        }

On exit from the method, we instruct it to return `helloWorldBean.sayHelloProperty()`:

    	@GetMapping(produces=MediaType.TEXT_PLAIN_VALUE)
	    public String sayHello() {
		    log.info("Log from Reactive controller");
		    return helloWorldBean.sayHelloProperty();
	    }

Finally, we start the application and execute the following command to make the request


    curl -X GET "http://localhost:8080/hello"


And we should get the following answer:


    Hello World with property value: HellofromApplicationYml


## Support

 - In case you detect any issue associated with the Darwin framework, please open an issue through the support channel: [Report Issue](https://github.com/santander-group-gluon/gln-adoption-entities/issues)
 - In case you detect any issue on a Spain based project, please sign up on this support channel and open an issue: [Report Issue - Spain based project](https://sanes.atlassian.net/jira/software/c/projects/ESPARQSOP/boards/480)

