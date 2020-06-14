package com.chl.applet.entity;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class HandoverOrder {
    private Integer id;
    private Integer userId;
    private String assetIds;
    private String transferTeam; //移交单位
    private String acceptTeam; //接受单位
    private String transferDate;//移交日期
    private Integer statusNo;//交接状态代码  0:新建, 1:驳回, 2:进行中_移交, 3:进行中_接受, 4:完成
    private Date addTime;
    private Date updateTime;
    private List<Asset> assets;
    private User user;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTransferTeam() {
        return transferTeam;
    }

    public void setTransferTeam(String transferTeam) {
        this.transferTeam = transferTeam;
    }

    public String getAcceptTeam() {
        return acceptTeam;
    }

    public void setAcceptTeam(String acceptTeam) {
        this.acceptTeam = acceptTeam;
    }

    public String getTransferDate() {
        return transferDate;
    }

    public void setTransferDate(String transferDate) {
        this.transferDate = transferDate;
    }

    public Integer getStatusNo() {
        return statusNo;
    }

    public void setStatusNo(Integer statusNo) {
        this.statusNo = statusNo;
    }

    public String getAssetIds() {
        return assetIds;
    }

    public void setAssetIds(String assetIds) {
        this.assetIds = assetIds;
    }

    public List<Asset> getAssets() {
        return assets;
    }

    public void setAssets(List<Asset> assets) {
        this.assets = assets;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public HandoverOrder() {

    }

    @Override
    public String toString() {
        return "HandoverOrder{" +
                "id=" + id +
                ", userId=" + userId +
                ", assetIds='" + assetIds + '\'' +
                ", transferTeam='" + transferTeam + '\'' +
                ", acceptTeam='" + acceptTeam + '\'' +
                ", transferDate='" + transferDate + '\'' +
                ", statusNo=" + statusNo +
                ", addTime=" + addTime +
                ", updateTime=" + updateTime +
                ", assets=" + assets +
                ", user=" + user +
                '}';
    }
}
