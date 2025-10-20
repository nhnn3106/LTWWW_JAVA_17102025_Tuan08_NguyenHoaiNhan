/*
 * @ (#) .java    1.0
 * Copyright (c)  IUH. All rights reserved.
 */
package iuh.fit.edu.controllers;

import iuh.fit.edu.entities.Supplier;
import iuh.fit.edu.repositories.SupplierRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/*
 * @description
 * @author: Huu Thai
 * @date:
 * @version: 1.0
 */
@Controller
@AllArgsConstructor
@RequestMapping("/suppliers")
public class SupplierController {
    private final SupplierRepository supplierRepository;

    @GetMapping
    public String getAllSupplier(Model model){
        List<Supplier> suppliers = this.supplierRepository.findAll();
        model.addAttribute("nhaCungCaps", suppliers);
        return "supplier/list";
    }
    @PostMapping
    public String getListSupplierByKey(@RequestParam("keyword") String keyWord, Model model){
        List<Supplier> suppliers = this.supplierRepository.searchByKeyword(keyWord);
        model.addAttribute("nhaCungCaps", suppliers);
        model.addAttribute("keyWord", keyWord);
        return "supplier/list";
    }
}
