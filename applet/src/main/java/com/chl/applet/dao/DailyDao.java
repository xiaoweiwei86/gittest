package com.chl.applet.dao;

import com.chl.applet.entity.Daily;
import org.springframework.stereotype.Repository;


import java.util.List;

@Repository
public interface DailyDao {
    List<Daily> selectAll();
    Daily selectOne(Integer id);
    List<Daily> selectByUserId(Integer userId);
    List<Daily> selectByKeywords(Integer[] userIds, String startTime,String endTime);
    void delete(Integer id);
    void update(Daily daily);
    void insert(Daily daily);

}
