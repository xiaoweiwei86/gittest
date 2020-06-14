package com.chl.applet.service;

import com.chl.applet.entity.HandoverOrder;

import java.util.List;

public interface HandoverOrderService {
    List<HandoverOrder> findAll();
    List<HandoverOrder> findByUserId(Integer userId);
    List<HandoverOrder> findByStatusNos(Integer[] statusNos);
    List<HandoverOrder> findByAssetId(Integer assetId);
    List<HandoverOrder> findByTeam(String team);
    HandoverOrder findOne(Integer id);
    List<HandoverOrder> search(Integer[] assetIds,String transferTeam,String acceptTeam,Integer userId,String flag);
    void alterStatusNo(HandoverOrder handoverOrder);
    void add(HandoverOrder handoverOrder);
    void edit(HandoverOrder handoverOrder);
    void remove(Integer id);
}
