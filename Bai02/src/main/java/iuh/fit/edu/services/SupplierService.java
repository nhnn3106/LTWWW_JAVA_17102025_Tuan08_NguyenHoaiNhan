/*
 * @ (#) .java    1.0
 * Copyright (c)  IUH. All rights reserved.
 */
package iuh.fit.edu.services;


import iuh.fit.edu.entities.Supplier;

import java.util.List;

public interface SupplierService {
    Supplier findById(Long id);

    List<Supplier> findAll();
}
