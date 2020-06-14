package com.chl.applet.dao;

import com.chl.applet.entity.CategoryAsset;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryAssetDao {
    List<CategoryAsset> selectAll();
    CategoryAsset selectOne(Integer id);
    void insert(CategoryAsset categoryAsset);
    void update(CategoryAsset categoryAsset);
    void delete(Integer id);
}
