package com.semars.snookerscores;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/")
    public String index() {
        System.out.println("Hello World");
        return "Greetings from Spring Boot!";
    }

}
