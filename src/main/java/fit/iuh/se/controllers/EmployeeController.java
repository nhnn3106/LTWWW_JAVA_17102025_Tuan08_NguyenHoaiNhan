package fit.iuh.se.controllers;

import fit.iuh.se.entities.Employee;
import fit.iuh.se.services.EmployeeService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
    public ModelAndView showList(ModelAndView modelAndView) {
        List<Employee> employees = employeeService.findAll();
        employees.get(0).getFirstName();
        modelAndView.addObject("employees",employees);
        modelAndView.setViewName("list");
        return modelAndView;
    }

}
