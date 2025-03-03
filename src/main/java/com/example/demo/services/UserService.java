package com.example.demo.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.domain.Role;
import com.example.demo.domain.User;
import com.example.demo.repositories.RoleRepository;
import com.example.demo.repositories.UserRepository;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public UserService(
        UserRepository userRepository,
        RoleRepository roleRepository
    ) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    public List<User> getAllUsers() {
        return (List<User>) userRepository.findAll();
    }

    public User findById(long id) {
        return userRepository.findById(id).get();
    }

    public String handleSaveUser(User user) {
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

    public Role getRoleByRoleName(String roleName) {
        return roleRepository.findByName(roleName);
    }
}
