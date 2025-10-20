/*
 * @ (#) .java    1.0
 * Copyright (c)  IUH. All rights reserved.
 */
package iuh.fit.edu.services.impl;

import iuh.fit.edu.entities.Supplier;
import iuh.fit.edu.repositories.SupplierRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/*
 * @description
 * @author: Huu Thai
 * @date:
 * @version: 1.0
 */
@Service
@AllArgsConstructor
public class SupplierServiceImpl implements iuh.fit.edu.services.SupplierService {
    private final SupplierRepository supplierRepository;

    @Override
    public Supplier findById(Long id){
        return this.supplierRepository.findById(id).orElse(null);
    }
    @Override
    public List<Supplier> findAll(){
        return this.supplierRepository.findAll();
    }
}
