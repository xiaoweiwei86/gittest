package com.chl.applet.dao;

import com.chl.applet.entity.HandoverOrder;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HandoverOrderDao {
    List<HandoverOrder> selectAll();
    List<HandoverOrder> selectByStatusNos(Integer[] statusNo );
    List<HandoverOrder> selectByUserId(Integer userId);
    List<HandoverOrder> selectByAssetId(Integer assetId);
    List<HandoverOrder> selectByTeam(String team);
    List<HandoverOrder> search(Integer[] assetIds,String transferTeam,String acceptTeam,Integer userId,String flag);
    HandoverOrder selectOne(Integer id);
    void setStatusNo(HandoverOrder handoverOrder);
    void insert(HandoverOrder handoverOrder);
    void update(HandoverOrder handoverOrder);
    void delete(Integer id);
}
