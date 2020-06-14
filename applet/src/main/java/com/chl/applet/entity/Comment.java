package com.chl.applet.entity;

import java.util.Date;

public class Comment {
    private Integer id;
    private Integer userId; //用户ID
    private Integer edId;  //经验数据库ID
    private Integer dailyId; //日志ID
    private Integer handoverOrderId; //交接单ID
    private String content;
    private Date createTime;
    private Date alterTime;
    private User user;
    private ExperienceDatabase experienceDatabase;
    private Daily daily;
    private HandoverOrder handoverOrder;

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

    public Integer getEdId() {
        return edId;
    }

    public void setEdId(Integer edId) {
        this.edId = edId;
    }

    public Integer getDailyId() {
        return dailyId;
    }

    public void setDailyId(Integer dailyId) {
        this.dailyId = dailyId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getAlterTime() {
        return alterTime;
    }

    public void setAlterTime(Date alterTime) {
        this.alterTime = alterTime;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public ExperienceDatabase getExperienceDatabase() {
        return experienceDatabase;
    }

    public void setExperienceDatabase(ExperienceDatabase experienceDatabase) {
        this.experienceDatabase = experienceDatabase;
    }

    public Daily getDaily() {
        return daily;
    }

    public void setDaily(Daily daily) {
        this.daily = daily;
    }

    public Integer getHandoverOrderId() {
        return handoverOrderId;
    }

    public void setHandoverOrderId(Integer handoverOrderId) {
        this.handoverOrderId = handoverOrderId;
    }

    public HandoverOrder getHandoverOrder() {
        return handoverOrder;
    }

    public void setHandoverOrder(HandoverOrder handoverOrder) {
        this.handoverOrder = handoverOrder;
    }

    public Comment() {

    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", userId=" + userId +
                ", edId=" + edId +
                ", dailyId=" + dailyId +
                ", handoverOrderId=" + handoverOrderId +
                ", content='" + content + '\'' +
                ", createTime=" + createTime +
                ", alterTime=" + alterTime +
                ", user=" + user +
                ", experienceDatabase=" + experienceDatabase +
                ", daily=" + daily +
                ", handoverOrder=" + handoverOrder +
                '}';
    }
}
