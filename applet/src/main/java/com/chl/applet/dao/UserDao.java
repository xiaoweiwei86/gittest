package com.chl.applet.dao;

import com.chl.applet.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao {
    List<User> selectAll();
    User selectOne(Integer id);
    User selectByLoginName(String loginName);
    List<User> selectByRoleId(Integer roleId);
    List<User> selectByRealName(String realName);
    List<User> selectByTeamId(Integer teamId);
    List<User> search(String key,Integer teamId);
    void delete(Integer id);
    void update(User user);
    void insert(User user);
    void quit(User user);
}
