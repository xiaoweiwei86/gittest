package com.chl.applet.service.impl;

import com.chl.applet.dao.AssetDao;
import com.chl.applet.entity.Asset;
import com.chl.applet.service.AssetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class AssetServiceImpl implements AssetService {
    @Autowired
    private AssetDao assetDao;
    @Override
    public List<Asset> findAll() {
        return assetDao.selectAll();
    }

    @Override
    public List<Asset> findByTeam(String team) {
        return assetDao.selectByTeam(team);
    }

    @Override
    public List<Asset> search(String keywords, String team, Integer categoryId) {
        return assetDao.search(keywords,team,categoryId);
    }

    @Override
    public Asset findOne(Integer id) {
        return assetDao.selectOne(id);
    }

    @Override
    public List<Asset> findByIds(String ids) {
        return assetDao.selectByIds(ids.split(","));
    }

    @Override
    public Asset findByNumber(String number) {
        return assetDao.selectByNumber(number);
    }

    @Override
    public void add(Asset asset) {
        asset.setAddTime(new Date());
        assetDao.insert(asset);
    }

    @Override
    public void edit(Asset asset) {
        asset.setUpdateTime(new Date());
        assetDao.update(asset);
    }

    @Override
    public void remove(Integer id) {
        assetDao.delete(id);
    }
}
