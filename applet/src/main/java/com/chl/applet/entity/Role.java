package com.chl.applet.entity;

public class Role {
    private Integer id;
    private String nickName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }


    public Role() {

    }

    public Role(Integer id, String nickName) {
        this.id = id;
        this.nickName = nickName;
    }

    @Override
    public String toString() {
        return "Role{" +
                "id=" + id +
                ", nickName='" + nickName +
                '}';
    }
}
