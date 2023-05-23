package tapp.org.tapp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.context.properties.EnableConfigurationProperties;

@SpringBootApplication
@EnableConfigurationProperties
@EntityScan(basePackages = {"tapp.org.tapp.Models"})
public class TappApplication {

    public static void main(String[] args) {
        SpringApplication.run(TappApplication.class, args);
    }

}
