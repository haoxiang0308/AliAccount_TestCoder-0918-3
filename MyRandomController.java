import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MyRandomController {

    @GetMapping("/hello")
    public String sayHello() {
        return "Hello from the randomly named controller!";
    }
}