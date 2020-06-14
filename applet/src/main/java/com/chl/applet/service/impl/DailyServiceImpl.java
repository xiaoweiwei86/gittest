package com.chl.applet.service.impl;

import com.chl.applet.dao.DailyDao;
import com.chl.applet.entity.Daily;
import com.chl.applet.service.DailyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
@Service
public class DailyServiceImpl implements DailyService {
    @Autowired
    private DailyDao dailyDao;
    @Override
    public List<Daily> findAll() {
        return dailyDao.selectAll();
    }

    @Override
    public Daily findById(Integer id) {
        return dailyDao.selectOne(id);
    }

    @Override
    public List<Daily> searchByKeywords(Integer[] userIds, String startTime, String endTime) {
        return dailyDao.selectByKeywords(userIds, startTime, endTime);
    }

    @Override
    public List<Daily> findByUserId(Integer userId) {
        return dailyDao.selectByUserId(userId);
    }

    @Override
    public void add(Daily daily) {
        daily.setCreateTime(new Date());
        dailyDao.insert(daily);
    }

    @Override
    public void update(Daily daily) {
        Daily daily1 = dailyDao.selectOne(daily.getId());
        daily1.setItems(daily.getItems());
        daily1.setPerformance(daily.getPerformance());
        daily1.setModificationTime(new Date());
        dailyDao.update(daily1);
    }

    @Override
    public void delete(Integer id) {
        dailyDao.delete(id);
    }
}
