package com.chl.applet.controller;

import com.chl.applet.entity.CategoryAsset;
import com.chl.applet.service.CategoryAssetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/category")
public class CategoryController {
    @Autowired
    private CategoryAssetService categoryAssetService;

    @RequestMapping("to_add")
    public String toAdd() {
        return "asset/category_add";
    }

    @RequestMapping("add")
    public String add(CategoryAsset categoryAsset) {
        categoryAssetService.add(categoryAsset);
        return "redirect:list";
    }

    @RequestMapping("list")
    public String list(Map<String,Object> map ){
        List<CategoryAsset> list = categoryAssetService.findAll();
        if(!list.isEmpty()){
            map.put("list",list);
        }
        return "asset/category_list";
    }

    @RequestMapping("to_edit")
    public String toEdit(Map<String,Object> map,@RequestParam Integer id){
        CategoryAsset category = categoryAssetService.findOne(id);
        map.put("category",category);
        return "asset/category_edit";
    }

    @RequestMapping("edit")
    public String edit(CategoryAsset categoryAsset){
        categoryAssetService.edit(categoryAsset);
        return "redirect:list";
    }

    @RequestMapping("remove")
    public String remove(Integer id){
        categoryAssetService.remove(id);
        return "redirect:list";
    }
}
