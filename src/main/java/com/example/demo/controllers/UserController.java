package com.example.demo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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
}