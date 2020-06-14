package com.chl.applet.dao;

import com.chl.applet.entity.DailyDrafts;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DailyDraftsDao {
    DailyDrafts selectOne(Integer userId);
    void update(DailyDrafts daily);
    void insert(DailyDrafts daily);
    void delete(Integer userId);

}
