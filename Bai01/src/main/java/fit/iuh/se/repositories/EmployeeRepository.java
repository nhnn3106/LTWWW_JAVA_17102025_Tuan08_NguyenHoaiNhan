package fit.iuh.se.repositories;

import fit.iuh.se.entities.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface EmployeeRepository extends JpaRepository<Employee, Integer> {

    List<Employee> findByFirstNameContainingIgnoreCaseOrLastNameContainingIgnoreCase(String name, String name1);
}
