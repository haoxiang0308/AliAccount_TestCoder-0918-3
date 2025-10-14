package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RandomController {

    @GetMapping("/hello")
    public String sayHello() {
        return "Hello from the randomly generated controller!";
    }
}