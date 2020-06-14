package com.chl.applet.service;

import com.chl.applet.entity.Role;

import java.util.List;

public interface RoleService {
    List<Role> findAll();
    Role findByName(String name);
    Role findById(Integer id);
    void add(Role role);
    void edit(Role role);
    void remove(Integer id);
}
