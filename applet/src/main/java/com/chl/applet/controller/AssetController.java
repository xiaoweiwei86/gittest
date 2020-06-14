package com.chl.applet.controller;

import com.chl.applet.entity.Asset;
import com.chl.applet.entity.CategoryAsset;
import com.chl.applet.entity.User;
import com.chl.applet.service.AssetService;
import com.chl.applet.service.CategoryAssetService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/asset")
public class AssetController {
    @Autowired
    private CategoryAssetService categoryAssetService;
    @Autowired
    private AssetService assetService;
    private static final Integer pageSize = 8;
    private static final String orderBy = "add_time desc";


    @RequestMapping("to_add")
    public String toAdd(Map<String, Object> map) {
        List<CategoryAsset> category = categoryAssetService.findAll();
        map.put("category", category);
        return "asset/asset_add";
    }

    @RequestMapping("add")
    public String add(HttpSession session, Asset asset) {
        User user = (User) session.getAttribute("USER");
        assetService.add(asset);
        return "redirect:team_list?teamId=" + user.getTeamId();
    }

    @RequestMapping("list")
    public String list(Map<String, Object> map, @RequestParam(defaultValue = "1") Integer pageNum) {
        PageHelper.startPage(pageNum, pageSize, orderBy);
        List<Asset> list = assetService.findAll();
        PageInfo<Asset> page = new PageInfo<>(list);
        List<CategoryAsset> category = categoryAssetService.findAll();
        map.put("category", category);
        map.put("list", list);
        map.put("page", page);
        return "asset/asset_list";
    }

    @RequestMapping("team_list")
    public String teamList(HttpSession session, Map<String, Object> map, @RequestParam(defaultValue = "1") Integer pageNum) {
        User user = (User) session.getAttribute("USER");
        PageHelper.startPage(pageNum, pageSize, orderBy);
        List<Asset> list = assetService.findByTeam(user.getTeam());
        PageInfo<Asset> page = new PageInfo<>(list);
        List<CategoryAsset> category = categoryAssetService.findAll();
        map.put("category", category);
        map.put("list", list);
        map.put("page", page);
        return "asset/asset_team_list";
    }

    @RequestMapping("to_edit")
    public String toEdit(Map<String, Object> map, @RequestParam Integer id) {
        Asset asset = assetService.findOne(id);
        List<CategoryAsset> category = categoryAssetService.findAll();
        map.put("category", category);
        map.put("asset", asset);
        return "asset/asset_edit";
    }

    @RequestMapping("edit")
    public String edit(HttpSession session, Asset asset) {
        User user = (User) session.getAttribute("USER");
        assetService.edit(asset);
        return "redirect:team_list?teamId=" + user.getTeamId();
    }

    @RequestMapping("find_one")
    public String findOne(Map<String, Object> map, @RequestParam Integer id) {
        Asset asset = assetService.findOne(id);
        map.put("asset", asset);
        return "asset/asset_one";
    }

    @RequestMapping("find_number")
    @ResponseBody
    public Asset findByNumber(@RequestParam String number) {
        Asset asset = assetService.findByNumber(number);
        return asset;
    }

    @RequestMapping("find_by_ids")
    @ResponseBody
    public List<Asset> findByIds(@RequestParam String ids) {
        List<Asset> assets = assetService.findByIds(ids);
        return assets;
    }

    @RequestMapping("search")
    public String search(HttpSession session, Map<String, Object> map, @RequestParam(defaultValue = "1") Integer pageNum, @RequestParam String keywords, @RequestParam(defaultValue = "") String team, @RequestParam Integer categoryId, @RequestParam String flag) {
        User user = (User) session.getAttribute("USER");
        if (flag.equals("1")) {
            team = user.getTeam();
        }
        PageHelper.startPage(pageNum, pageSize, orderBy);
        List<Asset> searchList = assetService.search(keywords.trim(), team, categoryId);
        PageInfo<Asset> page = new PageInfo<>(searchList);
        List<CategoryAsset> category = categoryAssetService.findAll();
        map.put("category", category);
        map.put("list", searchList);
        map.put("page", page);
        map.put("keywords", keywords);
        map.put("categoryId", categoryId);
        map.put("isSearch", 1);
        if (flag.equals("1")) {
            return "asset/asset_team_list";
        } else {
            map.put("teamValue", team);
            return "asset/asset_list";
        }
    }
}

