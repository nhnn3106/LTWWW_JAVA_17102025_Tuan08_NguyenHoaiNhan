/*
 * @ (#) .java    1.0
 * Copyright (c)  IUH. All rights reserved.
 */
package iuh.fit.edu.repositories;

import iuh.fit.edu.entities.Phone;
import iuh.fit.edu.entities.Supplier;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface PhoneRepository extends JpaRepository<Phone, Long> {
    List<Phone> findByNhaCungCap(Supplier nhaCungCap);
}
