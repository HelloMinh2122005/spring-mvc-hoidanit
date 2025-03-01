package com.example.demo.services;

import org.springframework.stereotype.Service;

import com.example.demo.domain.User;
import com.example.demo.repositories.UserRepository;

@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }



    public String handleHello(User user) {
        return userRepository.save(user).toString();
    }
}
