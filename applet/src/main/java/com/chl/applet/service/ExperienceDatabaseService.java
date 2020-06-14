package com.chl.applet.service;

import com.chl.applet.entity.ExperienceDatabase;


import java.util.List;

public interface ExperienceDatabaseService {
    List<ExperienceDatabase> findAll();

    ExperienceDatabase findOneById(Integer id);

    List<ExperienceDatabase> findByUserId(Integer userId);

    List<ExperienceDatabase> findByKeywords(String keywords, String startTime, String endTime,Integer audit,Integer userId);

    List<ExperienceDatabase> findChecked(Integer teamId, String keywords, String startTime, String endTime);

    List<ExperienceDatabase> findByTeamId(Integer teamId, Integer audit);

    Integer findCheckNum(Integer teamId);

    void delete(Integer id);

    void remove(Integer id); //经验数据库移除（前台不显示）

    void approve(Integer id); //经验数据库审核上线（前台显示）

    void sendCheck(Integer id);//发送审核请求，将Audit字段设置为2

    void noCheck(Integer id); //驳回请求，将audit字段设置为3

    void update(ExperienceDatabase experienceDatabase);

    void insert(ExperienceDatabase experienceDatabase);
}
