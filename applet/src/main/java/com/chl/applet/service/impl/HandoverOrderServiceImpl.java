package com.chl.applet.service.impl;

import com.chl.applet.dao.AssetDao;
import com.chl.applet.dao.HandoverOrderDao;
import com.chl.applet.entity.Asset;
import com.chl.applet.entity.HandoverOrder;
import com.chl.applet.service.HandoverOrderService;
import com.chl.applet.util.TeamUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class HandoverOrderServiceImpl implements HandoverOrderService {
    @Autowired
    private HandoverOrderDao handoverOrderDao;
    @Autowired
    private AssetDao assetDao;

    @Override
    public List<HandoverOrder> findAll() {
        List<HandoverOrder> list = handoverOrderDao.selectAll();
        for (HandoverOrder handoverOrder : list) {
            List<Asset> assets = assetDao.selectByIds(handoverOrder.getAssetIds().split(","));
            handoverOrder.setAssets(assets);
        }
        return list;
    }

    @Override
    public List<HandoverOrder> findByUserId(Integer userId) {
        List<HandoverOrder> list = handoverOrderDao.selectByUserId(userId);
        getAssets(list);
        return list;
    }

    @Override
    public List<HandoverOrder> findByStatusNos(Integer[] statusNo) {
        List<HandoverOrder> list = handoverOrderDao.selectByStatusNos(statusNo);
        getAssets(list);
        return list;
    }

    @Override
    public List<HandoverOrder> findByAssetId(Integer assetId) {
        List<HandoverOrder> list = handoverOrderDao.selectByAssetId(assetId);
        getAssets(list);
        return list;
    }

    @Override
    public List<HandoverOrder> findByTeam(String team) {
        List<HandoverOrder> list = handoverOrderDao.selectByTeam(team);
        getAssets(list);
        return list;
    }

    @Override
    public HandoverOrder findOne(Integer id) {
        HandoverOrder handoverOrder = handoverOrderDao.selectOne(id);
        List<Asset> assets = assetDao.selectByIds(handoverOrder.getAssetIds().split(","));
        handoverOrder.setAssets(assets);
        return handoverOrder;
    }

    @Override
    public List<HandoverOrder> search(Integer[] assetIds, String transferTeam, String acceptTeam,Integer userId,String flag) {
        List<HandoverOrder> list = handoverOrderDao.search(assetIds, transferTeam, acceptTeam,userId,flag);
        getAssets(list);
        return list;
    }

    @Override
    public void alterStatusNo(HandoverOrder handoverOrder) {
        handoverOrder.setUpdateTime(new Date());
        handoverOrderDao.setStatusNo(handoverOrder);
    }

    @Override
    public void add(HandoverOrder handoverOrder) {
        handoverOrder.setStatusNo(0);
        handoverOrder.setAddTime(new Date());
        handoverOrderDao.insert(handoverOrder);
    }

    @Override
    public void edit(HandoverOrder handoverOrder) {
        handoverOrder.setStatusNo(0);
        handoverOrder.setUpdateTime(new Date());
        handoverOrderDao.update(handoverOrder);
    }

    @Override
    public void remove(Integer id) {
        handoverOrderDao.delete(id);
    }

    public void getAssets(List<HandoverOrder> list) {
        for (HandoverOrder handoverOrder : list) {
            List<Asset> assets = assetDao.selectByIds(handoverOrder.getAssetIds().split(","));
            handoverOrder.setAssets(assets);
        }
    }
}
