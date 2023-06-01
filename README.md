# Installation von *TAPP*
Die detailierte Beschreibung der Installation von Tapp lässt sich von der [Installationsanleitung](https://github.com/Shikamaakuma/TAPP/blob/documentation/doc/installation-guide.md) entnehmen.

## Notwendiges zum Starten von *TAPP*
Folgende Dinge sind vonnöten, um *TAPP* starten zu können:
- Jar von *TAPP*
- Konfigurationsdatei
- JRE 17
- SSL Zertifikat
- Zugang zu Postgresql 14 DB

### Jar-File
Das Jar kann von dem [letzten Release dieses Repositories](https://github.com/Shikamaakuma/TAPP/releases/latest) entnommen werden.

### Konfigurationsdatei
Es muss eine Datei für das Starten von Tapp erstellt werden. Diese kann beispielsweise den Namen *tapp.properties* erhalten.

Folgender Inhalt ist notwendig:
```
spring.datasource.username=xxx
spring.datasource.password=xxx
spring.datasource.url=xxx
spring.datasource.driverClassName=org.postgresql.Driver
spring.jpa.show-sql=true
spring.jpa.hibernate.ddl-auto=update
spring.data.jpa.repositories.enabled=true
server.port=xxx
server.ssl.key-store=xxx
server.ssl.key-store-password= xxx
server.ssl.keyStoreType= PKCS12
server.ssl.keyAlias= tomcat
```

* `spring.datasource.username=xxx` Definierter Username in der Datenbank
* `spring.datasource.password` Definiertes Passwort für den Benutzer *tapp* in der Datenbank
* `spring.datasource.url` URL für die entsprechende Datenbank (Beispiel für eine lokale Datenbank: *jdbc:postgresql://localhost:5432/training*)
* `server.port` Port auf welchem TAPP laufen soll.
	* Best practice ist 80 (http) oder 443 (https). In unserem Fall ist es Port 8080.
* `server.ssl.key-store` Pfad zu einem SSL-Zertifikat für die Kommunikation von Frontend zu Backend.
* `server.ssl.key-store-password` Verwendetes Passwort für den SSL-Keystore.

## Starten von *TAPP*
Wenn die Konfigurationsdatei und das Jar bereitgestellt sind, lässt sich die Applikation mittels folgendem kommando starten:

```java -jar tapp-x.x.x.jar --spring.config.location=file:///path/to/tapp.properties```

wobei *tapp-x.x.x.jar das zu startende jar-file und */path/to/tapp.properties* der Pfad zum entsprechenden Konfigurationsfile ist.
