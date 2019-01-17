FROM centos:7.5.1804 
MAINTAINER yiidtw@gmail.com 

ENV JAVA_HOME=/usr/lib/jvm/java-openjdk
ENV M2_HOME=/usr/local/src/apache-maven
ENV PATH=${M2_HOME}/bin:${PATH}

RUN yum install -y java-1.8.0-openjdk-devel sudo wget telnet && \
    useradd -ms /bin/bash centos && \
    passwd -d centos && \
    gpasswd -a centos wheel && \
    wget http://www-us.apache.org/dist/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz && \
    tar -xf apache-maven-3.6.0-bin.tar.gz && \
    mv apache-maven-3.6.0/ /usr/local/src/apache-maven/

WORKDIR /home/centos/hello-maven
COPY . .
RUN chown centos:centos /home/centos -R && \
    mvn clean package

USER centos
CMD ["java", "-cp", "target/hello-maven-1.0-SNAPSHOT.jar", "com.mycompany.myteam.App"]
