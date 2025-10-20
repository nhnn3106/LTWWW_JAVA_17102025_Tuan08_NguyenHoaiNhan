/*
 * @ (#) .java    1.0
 * Copyright (c)  IUH. All rights reserved.
 */
package iuh.fit.edu.services.impl;

import iuh.fit.edu.entities.Phone;
import iuh.fit.edu.entities.Supplier;
import iuh.fit.edu.repositories.PhoneRepository;
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
public class PhoneServiceImpl implements iuh.fit.edu.services.PhoneService {
    private final PhoneRepository phoneRepository;

    @Override
    public Phone save(Phone phone){
        return this.phoneRepository.save(phone);
    }
    @Override
    public void delete(Long id){
        this.phoneRepository.deleteById(id);
    }
    @Override
    public Phone findById(Long id){
        return this.phoneRepository.findById(id).orElse(null);
    }
    @Override
    public List<Phone> findAll(){
        return this.phoneRepository.findAll();
    }

    @Override
    public List<Phone> findBySupplier(Supplier supplier) {
        return this.phoneRepository.findByNhaCungCap(supplier);
    }
}
