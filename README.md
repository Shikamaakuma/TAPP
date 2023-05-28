# TAPP setup guide

For the application to run, following infrastructure is necessary:
* Linux Ubuntu 20.04 LTS
* Java Runtime Environment (JRE) 17 
* Postgress DB 14

If the jar needs to be additionally built, also following is required:
* Java Development Kit (JDK) 17
* Flutter 3.7

## Installation
**If you do not have the jar yet, first follow the steps in the chapter "[how to get the jar](#how-to-get-the-jar)".**

### Install JRE
On Ubuntu, you need at least version 17 of a JRE.
To install that, run the following command:
```console
sudo apt install openjdk-17-jre
``` 

### Install Postgress

TODO:

### Install Keystore

TODO:

## Configuration

### Database
TODO:

### jdbc.properties
TAPP needs to have access to the internal database, so first of all we have to add a configuration file:
For that, create the folder *config* in *tapp* and add the file *jdbc.properties*
```console
mkdir -p /opt/tapp/config*
touch jdbc.properties
``` 

The file should look like this (xxx values have to be replaced with own configuration):
```file
spring.datasource.username=tapp
spring.datasource.password=xxx
spring.datasource.url=jdbc:postgresql://localhost:5432/training
spring.datasource.driverClassName=org.postgresql.Driver
spring.jpa.show-sql=true
spring.jpa.hibernate.ddl-auto=update
spring.data.jpa.repositories.enabled=true
server.port=xxx
server.ssl.key-store= /opt/tapp/config/keystore.p12
server.ssl.key-store-password= xxx
server.ssl.keyStoreType= PKCS12
server.ssl.keyAlias= tomcat
```

* `spring.datasource.password` Defined password for the user tapp in the database
* `server.port` The port where TAPP will be running.
	* Best practice is 80 (http) or 443 (https).
* `server.ssl.key-store-password` Password which was used while generating the ssl-keystore.

### tapp.service
To have a simple start option, TAPP will be set up as a daemon.

Create an initial service:
``` console
sudo touch /etc/systemd/system/tapp.service
```

Edit the file so it has the following content:
```console
[Unit]
Description=This Daemon runs the TAPP-Application
After=syslog.target network.target

[Service]
SuccessExitStatus=143

User=tapprunner
Group=tapprunner

Type=simple

WorkingDirectory=/opt/tapp/deployment
ExecStart=java -jar tapp-latest --spring.config.location=file:///opt/tapp/config/jdbc.properties
ExecStop=kill -15 $MAINPID

[Install]
WantedBy=multi-user.target
```

To make sure, the service is active and will start at startup, enter the following commands:
```console
sudo systemctl daemon-reload
sudo systemctl enable tapp.service
```

From now on, TAPP is starting automatically at boot and can be started with the following command:
```console
sudo systemctl start tapp.service
```

# How to get the jar
## Installation
### Install JDK
On Ubuntu, you need at least version 17 of a JDK.
To install that, run the following command:
```console
sudo apt install openjdk-17-jdk
``` 
### Install Flutter
Folllow the installation guide of Flutter to perform the installation. Follow the chapter [Install Flutter manually](https://docs.flutter.dev/get-started/install/linux#install-flutter-manually).

Optional development binaries (step 4 in online guide) are not necessary.

## Build the project
After all installations, download the source code and navigate into the sourcecodes directory.

Run the gradle wrapper to build the project:
```console
./gradlew build -x test
```

In the folder *build/libs/* the jar is available now. Copy the jar to the directory */opt/tapp/deployment*:
```console
mkdir -p /opt/tapp/deployment
cp -p <path/to/project>/build/libs/TAPP*.jar /opt/tapp/deployment/
```


