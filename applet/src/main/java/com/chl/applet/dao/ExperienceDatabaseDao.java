package com.chl.applet.dao;

import com.chl.applet.entity.ExperienceDatabase;
import com.chl.applet.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ExperienceDatabaseDao {
    List<ExperienceDatabase> selectAll();
    ExperienceDatabase selectOneById(Integer id);
    List<ExperienceDatabase> selectByUserId(Integer userId);
    List<ExperienceDatabase> selectByKeywords(String keywords,String startTime,String endTime,Integer audit,Integer userId);
    List<ExperienceDatabase> selectChecked(Integer teamId,String keywords,String startTime,String endTime);
    List<ExperienceDatabase> selectByTeamId(Integer teamId,Integer audit);
    Integer selectCheckNum(Integer teamId);
    void delete(Integer id);
    void update(ExperienceDatabase experienceDatabase);
    void insert(ExperienceDatabase experienceDatabase);
}
