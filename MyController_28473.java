import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MyController_28473 {

    @GetMapping("/hello")
    public String sayHello() {
        return "Hello, World!";
    }
}