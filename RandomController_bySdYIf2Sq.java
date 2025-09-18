package com.example.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class RandomController_bySdYIf2Sq {

    @GetMapping("/hello")
    public String sayHello() {
        return "Hello, World! This is a Spring Boot REST endpoint.";
    }
    
    @GetMapping("/greeting")
    public Greeting greeting() {
        return new Greeting("Hello, World!", System.currentTimeMillis());
    }
    
    // Inner class for greeting response
    static class Greeting {
        private final String message;
        private final long timestamp;
        
        public Greeting(String message, long timestamp) {
            this.message = message;
            this.timestamp = timestamp;
        }
        
        public String getMessage() {
            return message;
        }
        
        public long getTimestamp() {
            return timestamp;
        }
    }
}