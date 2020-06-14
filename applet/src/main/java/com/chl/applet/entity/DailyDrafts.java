package com.chl.applet.entity;

import java.util.Date;

/**
 * 日志草稿箱
 */
public class DailyDrafts {
    private Integer userId;
    private String items;
    private String performance;
    private String createTime;

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

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public DailyDrafts() {

    }

    public DailyDrafts(Integer userId, String items, String performance, String createTime) {
        this.userId = userId;
        this.items = items;
        this.performance = performance;
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "DailyDrafts{" +
                "userId=" + userId +
                ", items='" + items + '\'' +
                ", performance='" + performance + '\'' +
                ", createTime=" + createTime +
                '}';
    }
}
