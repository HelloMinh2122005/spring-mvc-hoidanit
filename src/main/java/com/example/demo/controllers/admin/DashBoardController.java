package com.example.demo.controllers.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashBoardController {
    @GetMapping("/admin")
    public String getAdminPage() {
        return "admin/dashboard/index";
    }
}
