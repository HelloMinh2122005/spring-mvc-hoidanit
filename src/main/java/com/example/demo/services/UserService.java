package com.example.demo.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.domain.User;
import com.example.demo.repositories.UserRepository;

@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<User> getAllUsers() {
        return (List<User>) userRepository.findAll();
    }

    public User findById(long id) {
        return userRepository.findById(id).get();
    }

    public String handleHello(User user) {
        return userRepository.save(user).toString();
    }

    public String deleteUserByEmail(String email) {
        User user = userRepository.findByEmail(email);
        userRepository.delete(user);
        return "Delete User Success";
    }

    public String updateUser(User user) {
        userRepository.save(user);
        return "Update User Success";
    }

    public String deleteUserById(long id) {
        userRepository.deleteById(id);
        return "Delete User Success";
    }
}
