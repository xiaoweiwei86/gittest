package com.chl.applet.service;

import com.chl.applet.entity.Asset;

import java.util.List;

public interface AssetService {
    List<Asset> findAll();
    List<Asset> findByTeam(String team);
    List<Asset> search(String keywords,String team,Integer categoryId);
    Asset findOne(Integer id);
    List<Asset> findByIds(String ids);
    Asset findByNumber(String number);
    void add(Asset asset);
    void edit(Asset asset);
    void remove(Integer id);
}
