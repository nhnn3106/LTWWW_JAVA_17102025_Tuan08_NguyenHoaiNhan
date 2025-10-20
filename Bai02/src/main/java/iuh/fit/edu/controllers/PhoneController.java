/*
 * @ (#) .java    1.0
 * Copyright (c)  IUH. All rights reserved.
 */
package iuh.fit.edu.controllers;

import iuh.fit.edu.entities.Phone;
import iuh.fit.edu.entities.Supplier;
import iuh.fit.edu.services.PhoneService;
import iuh.fit.edu.services.SupplierService;
import iuh.fit.edu.services.UploadService;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/*
 * @description
 * @author: Huu Thai
 * @date:
 * @version: 1.0
 */
@Controller
@AllArgsConstructor
@RequestMapping("/phones")
public class PhoneController {
    private final PhoneService phoneService;
    private final SupplierService supplierService;
    private final UploadService uploadService;

    @GetMapping
    public String getAllPhone(@RequestParam(value = "maNCC", required = false) Long maNCC,
                              Model model){
        List<Phone> phones;
        List<Supplier> suppliers = supplierService.findAll();
        if (maNCC != null && maNCC != -1) {
            Supplier supplier = this.supplierService.findById(maNCC);
            phones = phoneService.findBySupplier(supplier);
        } else {
            phones = this.phoneService.findAll();
        }
        model.addAttribute("dienThoais", phones);
        model.addAttribute("nhaCungCaps", suppliers);
        model.addAttribute("maNCC", maNCC);
        return "phone/list";
    }
    @GetMapping("/add")
    public String getCreatePhonePage(Model model){
        List<Supplier> suppliers = supplierService.findAll();
        model.addAttribute("nhaCungCaps", suppliers);
        model.addAttribute("newDienThoai", new Phone());
        return "phone/add";
    }
    @PostMapping("/add")
    public String createPhone(@ModelAttribute("newDienThoai") @Valid Phone phone,
                              BindingResult newPhoneBindingResult,
                              @RequestParam("file")MultipartFile file, Model model){
        if(newPhoneBindingResult.hasErrors()){
            System.out.println("alo");
            List<Supplier> suppliers = supplierService.findAll();
            model.addAttribute("nhaCungCaps", suppliers);
            return "phone/add";
        }
        String image = this.uploadService.handleSaveUploadFile(file);
        System.out.println(image);
        phone.setHinhAnh(image);
        this.phoneService.save(phone);
        return "redirect:/phones";
    }

    @PostMapping("/delete/{id}")
    public String deletePhone(@PathVariable("id") Long id){
        this.phoneService.delete(id);
        return "redirect:/phones";
    }
}
