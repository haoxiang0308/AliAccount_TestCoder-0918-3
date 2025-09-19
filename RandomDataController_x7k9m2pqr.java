package com.example.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@RestController
@RequestMapping("/api")
public class RandomDataController {

    @GetMapping("/random-data")
    public Map<String, Object> getRandomData() {
        Map<String, Object> response = new HashMap<>();
        Random random = new Random();
        
        response.put("id", random.nextInt(1000));
        response.put("message", "Hello from Spring Boot!");
        response.put("timestamp", System.currentTimeMillis());
        response.put("randomValue", random.nextDouble());
        
        return response;
    }
}