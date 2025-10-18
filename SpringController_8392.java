import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class SpringController_8392 {

    public static void main(String[] args) {
        SpringApplication.run(SpringController_8392.class, args);
    }

    @GetMapping("/hello")
    public String sayHello() {
        return "Hello from Spring Boot REST controller!";
    }
    
    @GetMapping("/info")
    public String getInfo() {
        return "This is a Spring Boot application with a REST controller.";
    }
}