package com.chl.applet.service.impl;

import com.chl.applet.dao.UserDao;
import com.chl.applet.entity.User;
import com.chl.applet.service.UserService;
import com.chl.applet.util.TeamUtil;
import com.chl.applet.util.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Value("${img-url}")
    private String imgUrl;
    @Override
    public List<User> findAll() {
        return userDao.selectAll();
    }

    @Override
    public User findOne(Integer id) {
        return userDao.selectOne(id);
    }

    @Override
    public User findByLoginName(String loginName) {
        return userDao.selectByLoginName(loginName);
    }

    @Override
    public List<User> findByRoleId(Integer roleId) {
        return userDao.selectByRoleId(roleId);
    }

    @Override
    public List<User> findByTeamId(Integer teamId) {
        return userDao.selectByTeamId(teamId);
    }

    @Override
    public List<User> findByRealName(String realName) {
        return userDao.selectByRealName(realName);
    }

    @Override
    public List<User> search(String key, Integer teamId) {
        return userDao.search(key,teamId);
    }

    @Override
    public void add(User user) {
        user.setCreateTime(new Date());
        user.setRoleId(2);
        user.setTeam(TeamUtil.getTeamNameById(user.getTeamId()));
        user.setPassword(MD5Utils.encode2hex(user.getPassword()));
        user.setUserImg(imgUrl+"/dog.png");
        userDao.insert(user);
    }

    @Override
    public void update(User user) {
        User user1= userDao.selectOne(user.getId());
        user1.setEmail(user.getEmail());
        user1.setRoleId(user.getRoleId());
        user1.setUserId(user.getUserId());
        user1.setRealName(user.getRealName());
        user1.setPhone(user.getPhone());
        user1.setUserImg(user.getUserImg());
        user1.setTeam(user.getTeam());
        user1.setTeamId(TeamUtil.getTeamIdByName(user.getTeam()));
        if(user.getPassword()!=null) {
            user1.setPassword(MD5Utils.encode2hex(user.getPassword()));
        }
        userDao.update(user1);
    }

    @Override
    public void remove(Integer id) {
        userDao.delete(id);
    }

    @Override
    public void quit(User user) {
        user.setOutTime(new Date());
        userDao.quit(user);
    }
}
