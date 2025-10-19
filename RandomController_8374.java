import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RandomController_8374 {
    
    @GetMapping("/hello")
    public String sayHello() {
        return "Hello from Spring Boot REST controller!";
    }
    
    @GetMapping("/greet")
    public String greet() {
        return "Greetings from the server!";
    }
}