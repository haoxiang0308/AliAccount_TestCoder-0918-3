import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController
@RequestMapping("/api")
public class RandomController12345 {
    
    @GetMapping("/hello")
    public String sayHello() {
        return "Hello from Spring Boot REST controller!";
    }
    
    @GetMapping("/info")
    public String getInfo() {
        return "This is a sample Spring Boot application with REST endpoints.";
    }
}