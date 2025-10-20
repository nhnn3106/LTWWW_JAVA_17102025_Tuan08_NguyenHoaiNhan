/*
 * @ (#) .java    1.0
 * Copyright (c)  IUH. All rights reserved.
 */
package iuh.fit.edu.services;/*
 * @description
 * @author: Huu Thai
 * @date:
 * @version: 1.0
 */

import iuh.fit.edu.entities.Phone;
import iuh.fit.edu.entities.Supplier;

import java.util.List;

public interface PhoneService {
    Phone save(Phone phone);

    void delete(Long id);

    Phone findById(Long id);

    List<Phone> findAll();

    List<Phone> findBySupplier(Supplier supplier);
}
