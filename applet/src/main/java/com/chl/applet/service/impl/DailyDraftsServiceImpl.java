package com.chl.applet.service.impl;

import com.chl.applet.dao.DailyDraftsDao;
import com.chl.applet.entity.DailyDrafts;
import com.chl.applet.service.DailyDraftsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;

@Service
public class DailyDraftsServiceImpl implements DailyDraftsService {
    @Autowired
    private DailyDraftsDao dailyDraftsDao;
    @Override
    public DailyDrafts findOne(Integer userId) {
        return dailyDraftsDao.selectOne(userId);
    }

    @Override
    public void add(DailyDrafts dailyDrafts) {
        SimpleDateFormat format =new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
        dailyDrafts.setCreateTime(format.format(new Date()));
        dailyDraftsDao.insert(dailyDrafts);
    }

    @Override
    public void update(DailyDrafts dailyDrafts) {
        SimpleDateFormat format =new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
        dailyDrafts.setCreateTime(format.format(new Date()));
        dailyDraftsDao.update(dailyDrafts);
    }

    @Override
    public void delete(Integer userId) {
        dailyDraftsDao.delete(userId);
    }
}
