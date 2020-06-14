package com.chl.applet.service.impl;

import com.chl.applet.dao.CategoryAssetDao;
import com.chl.applet.entity.CategoryAsset;
import com.chl.applet.service.CategoryAssetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryAssetServiceImpl implements CategoryAssetService {
    @Autowired
    private CategoryAssetDao categoryAssetDao;
    @Override
    public List<CategoryAsset> findAll() {
        return categoryAssetDao.selectAll();
    }

    @Override
    public CategoryAsset findOne(Integer id) {
        return categoryAssetDao.selectOne(id);
    }

    @Override
    public void add(CategoryAsset categoryAsset) {
        categoryAssetDao.insert(categoryAsset);
    }

    @Override
    public void edit(CategoryAsset categoryAsset) {
        categoryAssetDao.update(categoryAsset);
    }

    @Override
    public void remove(Integer id) {
        categoryAssetDao.delete(id);
    }
}
