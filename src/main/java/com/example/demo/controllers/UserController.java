package com.example.demo.controllers;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.domain.User;
import com.example.demo.services.UserService;

import jakarta.servlet.ServletContext;

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
    private final ServletContext servletContext;

    public UserController(
        UserService userService,
        ServletContext servletContext
    ) {
        this.userService = userService;
        this.servletContext = servletContext;
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
    public String postAdminUserCreatePage(Model model, @ModelAttribute("newUser") User newUser, @RequestParam("dinhminhFile") MultipartFile file) {
        model.addAttribute("message", "Create User Success" + newUser);
        // this.userService.handleHello(newUser);
        System.out.println(newUser.getRole());
        System.out.println(file.getOriginalFilename());

        try {
            byte[] bytes = file.getBytes();
            String rootPath = this.servletContext.getRealPath("/resources/images/");

            File dir = new File(rootPath + File.separator + "avatars");
            if (!dir.exists())
                dir.mkdirs();

            // Create the file on server
            File serverFile = new File(dir.getAbsolutePath() + File.separator + 
                System.currentTimeMillis() + "_" + file.getOriginalFilename());

            BufferedOutputStream stream;
            stream = new BufferedOutputStream(new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();
        } catch (IOException ex) {
            return "redirect:/admin/user";
        }

        return "redirect:/admin/user/user-table";
    }

    @GetMapping("/admin/user/user-table")
    public String getUserTable(Model model) {
        model.addAttribute("users", this.userService.getAllUsers());
        return "admin/user/user-table";
    }

    @GetMapping("/admin/user/detail/{id}")
    public String getUserDetailPage(Model model, @PathVariable("id") long id) {
        model.addAttribute("user", this.userService.findById(id));
        return "admin/user/detail";
    }

    @GetMapping("/admin/user/edit/{id}")
    public String getEditUserPage(Model model, @PathVariable("id") long id) {
        model.addAttribute("user", this.userService.findById(id));
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