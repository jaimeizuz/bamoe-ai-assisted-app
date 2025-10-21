# kogito-archetype
Process PaaS Archetype for creating a new Kogito project


Use this archetype to create a new Kogito project running:

```
mvn archetype:generate \
    -DarchetypeGroupId=es.santander.kogito-archetype \
    -DarchetypeArtifactId=kogito-archetype \
    -DarchetypeVersion=1.1.0-SNAPSHOT \
    -DgroupId=your.group.id \
    -DartifactId=your-project-name \
    -Dversion=1.0.0-SNAPSHOT
```

You can run the application as simple as running the mvn command:
```
mvn quarkus:dev
```

Once the application is started, the following services are accessible:

- Swagger: You can check the endpoints generated in the url:
```
http://localhost:8080/q/swagger-ui/ 
```
- Dev-ui: You can access the dev-ui in the url:
```
http://localhost:8080/q/dev-ui/
```
- Graphql-ui: You can access the graphql-ui in the url:
```
http://localhost:8080/q/graphql-ui
```




