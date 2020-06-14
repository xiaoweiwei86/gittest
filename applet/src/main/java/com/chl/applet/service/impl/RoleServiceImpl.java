package com.chl.applet.service.impl;

import com.chl.applet.dao.RoleDao;
import com.chl.applet.entity.Role;
import com.chl.applet.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleDao roleDao;
    @Override
    public List<Role> findAll() {
        return roleDao.selectAll();
    }

    @Override
    public Role findByName(String name) {
        return roleDao.selectByName(name);
    }

    @Override
    public Role findById(Integer id) {
        return roleDao.selectById(id);
    }

    @Override
    public void add(Role role) {
        roleDao.insert(role);
    }

    @Override
    public void edit(Role role) {
        roleDao.update(role);
    }

    @Override
    public void remove(Integer id) {
        roleDao.delete(id);
    }
}
