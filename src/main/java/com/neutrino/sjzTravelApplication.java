package com.neutrino;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan({"com.neutrino.mapper"})
@SpringBootApplication
public class sjzTravelApplication {

    public static void main(String[] args) {
        SpringApplication.run(sjzTravelApplication.class, args);
    }

}
