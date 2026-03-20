package trankimtrong.example.trankimtrong;

import java.time.Year;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping({"/", "/home"})
    public String home(Model model) {
        model.addAttribute("ownerName", "Tran Kim Trong");
        model.addAttribute("currentYear", Year.now().getValue());
        model.addAttribute("welcomeMessage", "Welcome to my Spring Boot page");
        return "views/index";
    }
}