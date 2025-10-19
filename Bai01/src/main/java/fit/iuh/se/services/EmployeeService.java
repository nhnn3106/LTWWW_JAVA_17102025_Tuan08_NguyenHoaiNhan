package fit.iuh.se.services;

import fit.iuh.se.entities.Employee;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

public interface EmployeeService {
    List<Employee> findAll();
    Employee findById(int id);
    boolean save(Employee e);
    boolean update(Employee e);
    boolean deleteById(int id);
    List<Employee> findByTen(String name);
}
