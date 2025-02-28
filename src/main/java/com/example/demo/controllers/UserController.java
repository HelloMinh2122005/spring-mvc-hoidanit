package com.example.demo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.demo.entities.UserEntity;
import com.example.demo.services.UserService;

// @RestController
// public class UserController {

//     private final UserService userService;

//     public UserController(UserService userService) {
//         this.userService = userService;
//     }

//     @RequestMapping("/home")
//     public String getHomePage() {
//         return this.userService.handleHello();
//     }
// }


@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/home")
    public String getHomePage(Model model) {
        model.addAttribute("message", "Hello User");
        return "hello";
    }

    @GetMapping("/admin/user")
    public String getAdminUserPage(Model model) {
        model.addAttribute("newUser", new UserEntity());
        return "admin/user/create";
    }

    @PostMapping("/admin/user/create")
    public String postAdminUserCreatePage(Model model, @ModelAttribute("newUser") UserEntity newUser) {
        model.addAttribute("message", "Create User Success" + newUser);
        return "hello";
    }

}