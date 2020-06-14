package com.chl.applet.entity;

import java.util.Date;

public class Daily {
    private Integer id;
    private Integer userId;
    private String items;
    private String performance;
    private Date createTime;
    private Date modificationTime;
    private User user;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getItems() {
        return items;
    }

    public void setItems(String items) {
        this.items = items;
    }

    public String getPerformance() {
        return performance;
    }

    public void setPerformance(String performance) {
        this.performance = performance;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getModificationTime() {
        return modificationTime;
    }

    public void setModificationTime(Date modificationTime) {
        this.modificationTime = modificationTime;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Daily() {

    }

    public Daily(Integer id, Integer userId, String items, String performance, Date createTime, Date modificationTime, User user) {
        this.id = id;
        this.userId = userId;
        this.items = items;
        this.performance = performance;
        this.createTime = createTime;
        this.modificationTime = modificationTime;
        this.user = user;
    }

    @Override
    public String toString() {
        return "Daily{" +
                "id=" + id +
                ", userId=" + userId +
                ", items='" + items + '\'' +
                ", performance='" + performance + '\'' +
                ", createTime=" + createTime +
                ", modificationTime=" + modificationTime +
                ", user=" + user +
                '}';
    }
}
