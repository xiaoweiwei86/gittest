package com.chl.applet.entity;

import java.util.Date;

public class Asset {
    private Integer id ;
    private Integer userId;
    private String number;
    private Integer categoryId;
    private String name;
    private String model;
    private String specification; //规格、配置
    private Integer amount;
    private String manufacturerCountry; //厂家、国别
    private Float originalValue; //原值
    private String manufacturingNumber;//出厂编号
    private String startUsingDate;//启用年月
    private String paymentReceivingDate;//入账时间
    private String usingTeam;
    private String custodian; //管理人
    private String controlledState; //管理状态
    private String qualitySituation;//质量情况
    private String affiliation; //设备归属
    private String abnormal; //异动情况
    private String remarks;//备注
    private Date addTime;
    private Date updateTime;
    private User user;
    private CategoryAsset categoryAsset;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

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

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getSpecification() {
        return specification;
    }

    public void setSpecification(String specification) {
        this.specification = specification;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public String getManufacturerCountry() {
        return manufacturerCountry;
    }

    public void setManufacturerCountry(String manufacturerCountry) {
        this.manufacturerCountry = manufacturerCountry;
    }

    public Float getOriginalValue() {
        return originalValue;
    }

    public void setOriginalValue(Float originalValue) {
        this.originalValue = originalValue;
    }

    public String getManufacturingNumber() {
        return manufacturingNumber;
    }

    public void setManufacturingNumber(String manufacturingNumber) {
        this.manufacturingNumber = manufacturingNumber;
    }

    public String getStartUsingDate() {
        return startUsingDate;
    }

    public void setStartUsingDate(String startUsingDate) {
        this.startUsingDate = startUsingDate;
    }

    public String getPaymentReceivingDate() {
        return paymentReceivingDate;
    }

    public void setPaymentReceivingDate(String paymentReceivingDate) {
        this.paymentReceivingDate = paymentReceivingDate;
    }

    public String getUsingTeam() {
        return usingTeam;
    }

    public void setUsingTeam(String usingTeam) {
        this.usingTeam = usingTeam;
    }

    public String getCustodian() {
        return custodian;
    }

    public void setCustodian(String custodian) {
        this.custodian = custodian;
    }

    public String getControlledState() {
        return controlledState;
    }

    public void setControlledState(String controlledState) {
        this.controlledState = controlledState;
    }

    public String getQualitySituation() {
        return qualitySituation;
    }

    public void setQualitySituation(String qualitySituation) {
        this.qualitySituation = qualitySituation;
    }

    public String getAffiliation() {
        return affiliation;
    }

    public void setAffiliation(String affiliation) {
        this.affiliation = affiliation;
    }

    public String getAbnormal() {
        return abnormal;
    }

    public void setAbnormal(String abnormal) {
        this.abnormal = abnormal;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
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

    public CategoryAsset getCategoryAsset() {
        return categoryAsset;
    }

    public void setCategoryAsset(CategoryAsset categoryAsset) {
        this.categoryAsset = categoryAsset;
    }

    public Asset() {

    }

    @Override
    public String toString() {
        return "Asset{" +
                "id=" + id +
                ", userId=" + userId +
                ", number='" + number + '\'' +
                ", categoryId=" + categoryId +
                ", name='" + name + '\'' +
                ", model='" + model + '\'' +
                ", specification='" + specification + '\'' +
                ", amount=" + amount +
                ", manufacturerCountry='" + manufacturerCountry + '\'' +
                ", originalValue=" + originalValue +
                ", manufacturingNumber='" + manufacturingNumber + '\'' +
                ", startUsingDate=" + startUsingDate +
                ", paymentReceivingDate=" + paymentReceivingDate +
                ", usingTeam='" + usingTeam + '\'' +
                ", custodian='" + custodian + '\'' +
                ", controlledState='" + controlledState + '\'' +
                ", qualitySituation='" + qualitySituation + '\'' +
                ", affiliation='" + affiliation + '\'' +
                ", abnormal='" + abnormal + '\'' +
                ", remarks='" + remarks + '\'' +
                ", addTime=" + addTime +
                ", updateTime=" + updateTime +
                ", user=" + user +
                ", categoryAsset=" + categoryAsset +
                '}';
    }
}
