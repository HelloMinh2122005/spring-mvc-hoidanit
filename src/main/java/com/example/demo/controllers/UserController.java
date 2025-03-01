package com.example.demo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.demo.domain.User;
import com.example.demo.repositories.UserRepository;
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
    private final UserRepository userRepository;

    public UserController(
        UserService userService,
        UserRepository userRepository
    ) {
        this.userService = userService;
        this.userRepository = userRepository;
    }

    @GetMapping("/home")
    public String getHomePage(Model model) {
        model.addAttribute("message", "Hello User");
        return "hello";
    }

    @GetMapping("/admin/user")
    public String getAdminUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping("/admin/user/create")
    public String postAdminUserCreatePage(Model model, @ModelAttribute("newUser") User newUser) {
        model.addAttribute("message", "Create User Success" + newUser);
        this.userService.handleHello(newUser);
        return "redirect:/admin/user/user-table";
    }

    @GetMapping("/admin/user/user-table")
    public String getUserTable(Model model) {
        model.addAttribute("users", this.userService.getAllUsers());
        return "admin/user/user-table";
    }

    @GetMapping("/admin/user/detail/{id}")
    public String getUserDetailPage(Model model, @PathVariable("id") long id) {
        model.addAttribute("user", this.userRepository.findById(id).get());
        return "admin/user/detail";
    }

    @GetMapping("/admin/user/edit/{id}")
    public String getEditUserPage(Model model, @PathVariable("id") long id) {
        model.addAttribute("user", this.userRepository.findById(id).get());
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String postEditUserPage(Model model, @ModelAttribute("user") User user) {
        model.addAttribute("message", "Update User Success" + user);
        this.userService.updateUser(user);
        return "redirect:/admin/user/user-table";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String deleteUser(@PathVariable("id") long id) {
        this.userService.deleteUserById(id);
        return "redirect:/admin/user/user-table";
    }

}