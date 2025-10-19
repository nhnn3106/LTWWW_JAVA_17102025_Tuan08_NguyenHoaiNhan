package fit.iuh.se.services.impl;

import fit.iuh.se.entities.Employee;
import fit.iuh.se.repositories.EmployeeRepository;
import fit.iuh.se.services.EmployeeService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {
    private EmployeeRepository employeeRepository;

    public EmployeeServiceImpl(EmployeeRepository employeeRepository) {
        this.employeeRepository = employeeRepository;
    }

    @Override
    public List<Employee> findAll() {
        return employeeRepository.findAll();
    }

    @Override
    public Employee findById(int id) {
        return employeeRepository.findById(id).orElse(null);
    }

    @Override
    public boolean save(Employee e) {
        try {
            employeeRepository.save(e);
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    @Override
    public boolean update(Employee e) {
        try {
            employeeRepository.save(e);
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    @Override
    public boolean deleteById(int id) {
        try {
            employeeRepository.deleteById(id);
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    @Override
    public List<Employee> findByTen(String name) {
        return employeeRepository.findByFirstNameContainingIgnoreCaseOrLastNameContainingIgnoreCase(name,name);
    }
}
