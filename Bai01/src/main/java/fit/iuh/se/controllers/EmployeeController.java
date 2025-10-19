package fit.iuh.se.controllers;

import fit.iuh.se.entities.Employee;
import fit.iuh.se.services.EmployeeService;
import jakarta.validation.Valid;
import jakarta.validation.ValidatorFactory;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import java.util.List;

@Controller
@RequestMapping
public class EmployeeController {

    private EmployeeService employeeService;

    @Autowired
    public EmployeeController(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    @GetMapping
    public String showList(Model model) {
        List<Employee> employees = employeeService.findAll();
        model.addAttribute("employees",employees);
        model.addAttribute("employee", new Employee());
        return "list";

    }
    @GetMapping("/search")
    public String searchList(@RequestParam("firstName") String firstName, Model model) {
        List<Employee> employees = employeeService.findByTen(firstName);
        System.out.println(firstName);
        employees.forEach(System.out::println);
        model.addAttribute("employees",employees);
        model.addAttribute("employee");
        return "list";
    }

    @GetMapping("/add")
    public String showAdd(Model model) {
        model.addAttribute("employee", new Employee());
        return "add";
    }
    @GetMapping("/update")
    public String showUpdate(Model model, @RequestParam("id") int id) {
        Employee employee = employeeService.findById(id);
        if(employee == null) {
            model.addAttribute("id", id);
            return "not_found";
        }
        model.addAttribute("employee", employee);
        return "add";
    }

    @PostMapping("/save")
    public String save(Model model, @Valid @ModelAttribute("employee") Employee employee, BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            System.out.println("Validation errors found: " + bindingResult.getErrorCount());
            return "add";
        }
        if(employeeService.save(employee)) {
            model.addAttribute("employees", employeeService.findAll());
            return "list";
        }

        model.addAttribute("employee", employee);
        return "add";
    }

    @GetMapping("/delete")
    public String delete(Model model, @RequestParam("id") int id) {
        try {
            employeeService.deleteById(id);
            model.addAttribute("employees", employeeService.findAll());
            return "redirect:";
        } catch (Exception e) {
            model.addAttribute("id", id);
            return "not_found";
        }
    }

    public String returnHome(Model model) {
        model.addAttribute("employees", employeeService.findAll());
        return "list";
    }

}
