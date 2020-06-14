package com.chl.applet.service;

import com.chl.applet.entity.CategoryAsset;

import java.util.List;

public interface CategoryAssetService {
    List<CategoryAsset> findAll();
    CategoryAsset findOne(Integer id);
    void add(CategoryAsset categoryAsset);
    void edit(CategoryAsset categoryAsset);
    void remove(Integer id);
}
