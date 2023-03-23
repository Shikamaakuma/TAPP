package tapp.org.tapp2.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import tapp.models.DemoModel;
@Controller
public class DemoController {

    @GetMapping("/hello")
    public String sayHello(Model model, @RequestParam(value = "myName", defaultValue = "World") String name) {
        DemoModel demoModel = new DemoModel();
        demoModel.setDemoVar(name);
        model.addAttribute("demoModel", demoModel);
        return "demoView";
    }
}
