package com.chl.applet.dao;

import com.chl.applet.entity.Role;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoleDao {
    List<Role> selectAll();
    Role selectByName(String name);
    Role selectById(Integer id);
    void insert(Role role);
    void update(Role role);
    void delete(Integer id);
}
