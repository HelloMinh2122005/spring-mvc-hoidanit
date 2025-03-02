package com.example.demo.controllers.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProductController {
    @GetMapping("/admin/product")
    public String getAdminPage() {
        return "admin/product/index";
    }
}
