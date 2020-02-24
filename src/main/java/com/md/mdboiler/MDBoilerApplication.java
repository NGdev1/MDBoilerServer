package com.md.mdboiler;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages={"com.md.mdboiler"})
public class MDBoilerApplication {
    public static void main(String[] args) {
        SpringApplication.run(MDBoilerApplication.class, args);
    }
}
