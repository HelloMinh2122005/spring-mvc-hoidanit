package com.example.demo.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.domain.Role;

@Repository
public interface RoleRepository extends CrudRepository<Role, Long> {
    Role findByName(String roleName);
}