package com.chl.applet.entity;

import java.util.Date;
import java.util.List;

public class User {
    private  Integer id;
    private String userId; //工号
    private Integer roleId;//角色编号
    private String username;//用户名为唯一约束
    private String password;
    private String realName;
    private Integer teamId;//部门编号
    private String team;
    private String userImg;
    private String phone;
    private Date createTime;
    private Date outTime;
    private String email;
    private Role role;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public Integer getTeamId() {
        return teamId;
    }

    public void setTeamId(Integer teamId) {
        this.teamId = teamId;
    }

    public String getTeam() {
        return team;
    }

    public void setTeam(String team) {
        this.team = team;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date creatTime) {
        this.createTime = creatTime;
    }

    public Date getOutTime() {
        return outTime;
    }

    public void setOutTime(Date outTime) {
        this.outTime = outTime;
    }

    public String getUserImg() {
        return userImg;
    }

    public void setUserImg(String userImg) {
        this.userImg = userImg;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public User() {

    }

    public User(Integer id, String userId, Integer roleId, String username, String password, String realName, Integer teamId, String team, String userImg, String phone, Date createTime, Date outTime, String email, Role role) {
        this.id = id;
        this.userId = userId;
        this.roleId = roleId;
        this.username = username;
        this.password = password;
        this.realName = realName;
        this.teamId = teamId;
        this.team = team;
        this.userImg = userImg;
        this.phone = phone;
        this.createTime = createTime;
        this.outTime = outTime;
        this.email = email;
        this.role = role;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", userId='" + userId + '\'' +
                ", roleId=" + roleId +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", realName='" + realName + '\'' +
                ", teamId=" + teamId +'\''+
                ", team='" + team + '\'' +
                ", userImg='" + userImg + '\'' +
                ", phone='" + phone + '\'' +
                ", createTime=" + createTime +
                ", outTime=" + outTime +
                ", email='" + email + '\'' +
                ", role=" + role +
                '}';
    }
}
