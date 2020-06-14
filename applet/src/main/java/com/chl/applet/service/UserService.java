package com.chl.applet.service;


import com.chl.applet.entity.Role;
import com.chl.applet.entity.User;

import java.util.List;

public interface UserService {
    List<User> findAll();
    User findOne(Integer id);
    User findByLoginName(String loginName);
    List<User> findByRoleId(Integer roleId);
    List<User> findByTeamId(Integer teamId);
    List<User> findByRealName(String realName);
    List<User> search(String key,Integer teamId);
    void add(User user);
    void update(User user);
    void remove(Integer id);
    void quit(User user);
}
