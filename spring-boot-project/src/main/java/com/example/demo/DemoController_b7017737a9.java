package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DemoController_b7017737a9 {

    @GetMapping("/hello")
    public String sayHello() {
        return "Hello, World! This is a Spring Boot REST endpoint.";
    }
}