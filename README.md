# hello-maven-in-docker

## This is an example of configuring maven hello world docker
- code to create hello world app
```
$ mvn -B archetype:generate \
  -DarchetypeGroupId=org.apache.maven.archetypes \
  -DgroupId=com.mycompany.myteam \
  -DartifactId=hello-maven
```

- the default pom.xml is lack of build tag, so we rename it to pom.xml.orig
- sample command to run the java application
```
$ cd hello-maven
$ mvn package
$ java -cp target/hello-maven-1.0-SNAPSHOT.jar com.mycompany.myteam.App
```

- sample command to wrap it up to docker
```
# make sure we are still in hello-maven/
$ docker build -t hello-maven .
```
