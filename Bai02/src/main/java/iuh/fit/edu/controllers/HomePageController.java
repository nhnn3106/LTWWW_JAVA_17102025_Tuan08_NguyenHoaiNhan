/*
 * @ (#) .java    1.0
 * Copyright (c)  IUH. All rights reserved.
 */
package iuh.fit.edu.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


/*
 * @description
 * @author: Huu Thai
 * @date:
 * @version: 1.0
 */
@Controller
@RequestMapping("/")
public class HomePageController {
    @GetMapping
    public String getHomePage(){
        return "home";
    }
}
