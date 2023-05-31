# Server setup guide

Um den Ubuntu 22.04 LTS Server so aufzusetzen, wie er aktuell eingerichtet ist, sind folgende Applikationen notwendig:
* Java Development Kit (JDK) 17
* Jenkins 2.387
* Flutter 3.7
* PostgreSQL DB 14

## Installation
In diesem Abschnitt werden die verschiedenen Installationen aufgeführt

### JDK installieren
Es wird mindestens das JDK mit der Version 17 notwendig sein.
So kann es installiert werden:
```console
sudo apt install openjdk-17-jdk
``` 

### PostgreSQL installieren

Da bei dem Projekt-Setup kein externer Datenbank-Server verwendet wurde, wird Postgress 14 auch installiert:
```console
sudo apt install postgresql
```

### Jenkins installieren

Für das Builden und die Deployment-Tasks ist Jenkins auf dem Server notwendig. So wird es installiert:
```console
sudo apt install postgresql
```

### Keystore installieren

```console
keytool -genkeypair -alias tomcat -keyalg RSA -keysize 2048 -storetype PKCS12 -keystore keystore.p12
```

### Flutter installieren

Um das Jar builden zu können, ist eine Flutter-Installation von Nöten.

Dazu muss Flutter heruntergeladen und entpackt werden:
```console
mkdir /opt/flutter
cd /opt/flutter
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.10.2-stable.tar.xz
tar xf flutter_linux_3.10.2-stable.tar.xz
```

Damit der command *flutter* funktioniert, muss das binary noch verlinkt werden.
```console
sudo ln -s /opt/flutter/flutter/bin/flutter /usr/bin/flutter
```

## Konfiguration

### Datenbank

Damit *TAPP* funktioniert, muss noch ein User angelegt und die Datenbank *training* erstellt werden.
```console
sudo -u postgres createuser --interactive --password tapp
sudo -u postgres createdb training -O tapp
```

### SSL Keystore
Damit Flutter mit dem Backend kommunizieren kann, ist ein Zertifikat notwendig.
Dieses wird in dem Ordner *config* generiert:

```console
cd /opt/tapp/config
keytool -genkeypair -alias tomcat -keyalg RSA -keysize 2048 -storetype PKCS12 -keystore keystore.p12
```

### jdbc.properties
*TAPP* braucht den Zugang zur Datenbank, somit müssen wir das Konfigurations-File so anpassen.
Es soll ein Ordner *config* in *tapp* erstellt und das File *jdbc.properties* hinzugefügt werden:
```console
mkdir -p /opt/tapp/config
touch jdbc.properties
``` 

Die Datei sollte wie folgt aussehen (xxx mit eigener Konfiguration ersetzen):
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

* `spring.datasource.password` Definiertes Passwort für den Benutzer *tapp* in der Datenbank
* `server.port` Port auf welchem TAPP laufen soll.
	* Best practice ist 80 (http) oder 443 (https). In unserem Fall ist es Port 8080.
* `server.ssl.key-store-password` Verwendetes Passwort für den SSL-Keystore.

### Scripts für Deployments

Da Jenkins für das Deployment verwendet wird, braucht es Scripts zum ausführen:

```console
mkdir /opt/tapp/scripts
touch /opt/tapp/scripts/deploy-tapp.sh
touch /opt/tapp/scripts/restart-tapp.sh
```

#### deploy-tapp.sh

Das Script ```deploy-tapp.sh``` ist für das korrekte kopieren des letzten Jar-Files an die Stelle an der es deployed wird und braucht folgenden Inhalt:

```console
#! /bin/bash

jar_path="/var/lib/jenkins/workspace/TAPP/build/libs"
latest_jar="$(ls ${jar_path} -t | grep -v *plain* | head -1)"
dest_path="/opt/tapp/deployment"

cp $jar_path/$latest_jar $dest_path
rm $dest_path/tapp-latest
ln -s $latest_jar $dest_path/tapp-latest
```

#### restart-tapp.sh

Um die Berechtigungen von Jenkins einzugrenzen, wird ein separates Script, welches Jenkins mit Sudo-Rechten ausführen darf, für den Neustart von *TAPP* erstellt.
So soll das script ```restart-tapp.sh``` aussehen:

```console
#! /bin/bash

# Pay attention with editing this file!!!
# User Jenkins has sudo rights to execute this file!
sudo systemctl restart tapp.service
```

### Berechtigungen korrekt verteilen

Um die Berechtigungen der Benutzer *Jenkins* und *tapprunner* so zu setzen, dass keine ungewollten Zugriffe passieren, müssen die Berechtigungen wie folgt gesetzt werden:
```console
chown -R root: /opt/tapp
chown -R jenkins: /opt/flutter
chown -R tapprunner: /opt/tapp/config
chmod 400 /opt/tapp/config/jdbc.properties
chown root /opt/tapp/config/keystore.p12
chmod 400 /opt/tapp/config/keystore.p12
chown -R jenkins: /opt/tapp/deployment
chown jenkins: /opt/tapp/scripts/deploy-tapp.sh
chmod 400 /opt/tapp/scripts/deploy-tapp.sh
chmod 400 /opt/tapp/scripts/restart-tapp.sh
```

Damit jenkins das Script ```restart-tapp.sh``` als root starten kann, muss noch folgende Zeile im sudoers-file eingetragen werden:

```console
sudo visudo
```

```console
# add following line
jenkins ALL=(root) NOPASSWD: /opt/tapp/scripts/restart-tapp.sh
```

### Jenkins Konfigurieren

In Jenkins soll ein neuer Job erstellt werden.

Folgende Schritte müssen konfiguriert werden:
- [Source Code Management](source-code-management)
- [Build Trigger](build-trigger)
- [Build Steps](build-steps)
- [Post Build Actions](post-build-actions)

#### Source Code Management

Hier soll das git-repository angegeben werden, von wo die Daten gezogen werden sollen. Im Umfang dieses Projektes ist dies der dev-branch, bei Weiterführung sollte dieser auf den Main gewechselt werden.

```repository URL: https://github.com/Shikamaakuma/TAPP```

```Branch specifier: */dev```

#### Build Trigger

Der Build Trigger soll ein GitHub Hook Trigger sein. Dieser muss im GitHub-Repository hinterlegt werden.

#### Build Steps

Zum builden wird der Gradle-Wrapper verwendet. Wichtig ist, dass *fullBuild* und nicht *build* ausgeführt wird, da in diesem Task auch das kompilieren von Flutter ausgeführt wird.
Folgende Zeile soll also eingetragen werden beim ```tasks``` command:

```fullBuild -s --rerun-tasks```

#### Post Build Actions

Die Post Build Actions werden für das deployment verwendet. Hier werden lediglich die zwei zuvor erstellten Scripts ausgeführt, sofern der Build erfolgreich war:

```console
/opt/tapp/scripts/deploy-tapp.sh
sudo /opt/tapp/scripts/restart-tapp.sh
```

### tapp.service
Damit *TAPP* simpel gestartet und gestoppt, sowie auch die Logs von Systemd gefangen werden, wird ein Daemon für *TAPP* erstellt.

Um die Applikation aber abgegerenzt zu starten, brauchen wir einen Account dafür:
```console
sudo useradd -m tapprunner
```

Danach erstellen wir einen initialen Service
``` console
sudo touch /etc/systemd/system/tapp.service
```

Den Inhalt des Services passen wir wie folgt an:
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

Um den Service zu aktivieren und somit sicherzustellen, dass er beim Starten des Services ausgeführt wird, werden folgende Befehle ausgeführt:
```console
sudo systemctl daemon-reload
sudo systemctl enable tapp.service
```

Nun kann *TAPP* mit folgendem Command gestartet werden:
```console
sudo systemctl start tapp.service
```
