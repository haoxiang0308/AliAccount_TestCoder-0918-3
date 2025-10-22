import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.http.ResponseEntity;

@RestController
public class RandomController {

    @GetMapping("/hello")
    public ResponseEntity<String> getHello() {
        return ResponseEntity.ok("Hello from Spring Boot REST controller!");
    }
}