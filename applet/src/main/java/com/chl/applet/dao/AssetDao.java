package com.chl.applet.dao;

import com.chl.applet.entity.Asset;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AssetDao {
    List<Asset> selectAll();
    List<Asset> selectByTeam(String team);
    List<Asset> search(String keywords,String team,Integer categoryId);
    Asset selectOne(Integer id);
    List<Asset> selectByIds(String[] ids);
    Asset selectByNumber(String number);
    void insert(Asset asset);
    void update(Asset asset);
    void delete(Integer id);
}
