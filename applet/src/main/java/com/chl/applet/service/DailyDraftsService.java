package com.chl.applet.service;

import com.chl.applet.entity.DailyDrafts;

public interface DailyDraftsService {
    DailyDrafts findOne(Integer userId);
    void add(DailyDrafts dailyDrafts);
    void update(DailyDrafts dailyDrafts);
    void delete(Integer userId);
}
