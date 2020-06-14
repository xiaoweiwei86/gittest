package com.chl.applet.service;

import com.chl.applet.entity.Daily;

import java.util.Date;
import java.util.List;

public interface DailyService {
    List<Daily> findAll();
    Daily findById(Integer id);
    List<Daily> searchByKeywords(Integer[] userIds, String startTime,String endTime);
    List<Daily> findByUserId(Integer userId);
    void add(Daily daily);
    void update(Daily daily);
    void delete(Integer id);
}
