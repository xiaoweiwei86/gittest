package com.chl.applet.entity;

import java.util.Date;

public class ExperienceDatabase {
    private Integer id;
    private Integer userId;
    private String title;  //主题
    private String productClass; //产品类别
    private String productModel; //产品型号
    private String problemDescription; //问题描述
    private String failureMode; //失效模式
    private String positionFault; //故障地点
    private String amount; //数量
    private String dateString; //发生日期
    private String problemInput; //问题输入
    private String reasonAnalysis; //原因分析
    private String primePiece; //主凶件
    private String primeCategory; //主凶类别
    private String temporaryImprovementMeasures; //临时改进措施
    private String formalImprovementMeasures; //正式改进措施
    private String entryPerson; //录入人
    private Date entryDate; //录入时间
    private Date alterDate;//修改时间
    private Integer recommend; //是否推荐
    private Integer audit; //是否上架 0:新建 1:通过 2:提交审核 3:被驳回
    private String positionPhase; //故障阶段
    private String summary; //经验总结
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getProductClass() {
        return productClass;
    }

    public void setProductClass(String productClass) {
        this.productClass = productClass;
    }

    public String getProductModel() {
        return productModel;
    }

    public void setProductModel(String productModel) {
        this.productModel = productModel;
    }

    public String getProblemDescription() {
        return problemDescription;
    }

    public void setProblemDescription(String problemDescription) {
        this.problemDescription = problemDescription;
    }

    public String getFailureMode() {
        return failureMode;
    }

    public void setFailureMode(String failureMode) {
        this.failureMode = failureMode;
    }

    public String getPositionFault() {
        return positionFault;
    }

    public void setPositionFault(String positionFault) {
        this.positionFault = positionFault;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getDateString() {
        return dateString;
    }

    public void setDateString(String dateString) {
        this.dateString = dateString;
    }

    public String getProblemInput() {
        return problemInput;
    }

    public void setProblemInput(String problemInput) {
        this.problemInput = problemInput;
    }

    public String getReasonAnalysis() {
        return reasonAnalysis;
    }

    public void setReasonAnalysis(String reasonAnalysis) {
        this.reasonAnalysis = reasonAnalysis;
    }

    public String getPrimePiece() {
        return primePiece;
    }

    public void setPrimePiece(String primePiece) {
        this.primePiece = primePiece;
    }

    public String getPrimeCategory() {
        return primeCategory;
    }

    public void setPrimeCategory(String primeCategory) {
        this.primeCategory = primeCategory;
    }

    public String getTemporaryImprovementMeasures() {
        return temporaryImprovementMeasures;
    }

    public void setTemporaryImprovementMeasures(String temporaryImprovementMeasures) {
        this.temporaryImprovementMeasures = temporaryImprovementMeasures;
    }

    public String getFormalImprovementMeasures() {
        return formalImprovementMeasures;
    }

    public void setFormalImprovementMeasures(String formalImprovementMeasures) {
        this.formalImprovementMeasures = formalImprovementMeasures;
    }

    public String getEntryPerson() {
        return entryPerson;
    }

    public void setEntryPerson(String entryPerson) {
        this.entryPerson = entryPerson;
    }

    public Date getEntryDate() {
        return entryDate;
    }

    public void setEntryDate(Date entryDate) {
        this.entryDate = entryDate;
    }

    public Date getAlterDate() {
        return alterDate;
    }

    public void setAlterDate(Date alterDate) {
        this.alterDate = alterDate;
    }

    public Integer getRecommend() {
        return recommend;
    }

    public void setRecommend(Integer recommend) {
        this.recommend = recommend;
    }

    public Integer getAudit() {
        return audit;
    }

    public void setAudit(Integer audit) {
        this.audit = audit;
    }

    public String getPositionPhase() {
        return positionPhase;
    }

    public void setPositionPhase(String positionPhase) {
        this.positionPhase = positionPhase;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }



    public ExperienceDatabase() {

    }

    public ExperienceDatabase(Integer id, Integer userId, String title, String productClass, String productModel, String problemDescription, String failureMode, String positionFault, String amount, String dateString, String problemInput, String reasonAnalysis, String primePiece, String primeCategory, String temporaryImprovementMeasures, String formalImprovementMeasures, String entryPerson, Date entryDate, Date alterDate, Integer recommend, Integer audit, String positionPhase, String summary,  User user) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.productClass = productClass;
        this.productModel = productModel;
        this.problemDescription = problemDescription;
        this.failureMode = failureMode;
        this.positionFault = positionFault;
        this.amount = amount;
        this.dateString = dateString;
        this.problemInput = problemInput;
        this.reasonAnalysis = reasonAnalysis;
        this.primePiece = primePiece;
        this.primeCategory = primeCategory;
        this.temporaryImprovementMeasures = temporaryImprovementMeasures;
        this.formalImprovementMeasures = formalImprovementMeasures;
        this.entryPerson = entryPerson;
        this.entryDate = entryDate;
        this.alterDate = alterDate;
        this.recommend = recommend;
        this.audit = audit;
        this.positionPhase = positionPhase;
        this.summary = summary;
        this.user = user;
    }

    @Override
    public String toString() {
        return "ExperienceDatabase{" +
                "id=" + id +
                ", userId=" + userId +
                ", title='" + title + '\'' +
                ", productClass='" + productClass + '\'' +
                ", productModel='" + productModel + '\'' +
                ", problemDescription='" + problemDescription + '\'' +
                ", failureMode='" + failureMode + '\'' +
                ", positionFault='" + positionFault + '\'' +
                ", amount='" + amount + '\'' +
                ", dateString='" + dateString + '\'' +
                ", problemInput='" + problemInput + '\'' +
                ", reasonAnalysis='" + reasonAnalysis + '\'' +
                ", primePiece='" + primePiece + '\'' +
                ", primeCategory='" + primeCategory + '\'' +
                ", temporaryImprovementMeasures='" + temporaryImprovementMeasures + '\'' +
                ", formalImprovementMeasures='" + formalImprovementMeasures + '\'' +
                ", entryPerson='" + entryPerson + '\'' +
                ", entryDate=" + entryDate +
                ", alterDate=" + alterDate +
                ", recommend=" + recommend +
                ", audit=" + audit +
                ", positionPhase='" + positionPhase + '\'' +
                ", summary='" + summary + '\'' +
                ", user=" + user +
                '}';
    }
}
