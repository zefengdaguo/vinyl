package com.neila.vinylback;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication
public class VinylBackApplication {

	public static void main(String[] args) {
		SpringApplication.run(VinylBackApplication.class, args);
	}

}
