package com.chl.applet.controller;

import com.chl.applet.entity.ExperienceDatabase;
import com.chl.applet.service.ExperienceDatabaseService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
public class SearchExperienceDatabaseController {
    @Autowired
    private ExperienceDatabaseService experienceDatabaseService;
    private static final Integer pageSize = 10;

    @GetMapping("search_home")
    public String search_home() {
        return "search_jysjk/home";
    }

    @GetMapping("search")
    public String search(Map<String, Object> map, @RequestParam("keywords") String keywords, @RequestParam(defaultValue = "1") Integer pageNum) {
        PageHelper.startPage(pageNum, pageSize);
        List<ExperienceDatabase> list = experienceDatabaseService.findByKeywords(keywords, "", "",1,null);
        PageInfo<ExperienceDatabase> page = new PageInfo<>(list);
        map.put("list", list);
        map.put("page", page);
        map.put("keywords", keywords);
        return "search_jysjk/search";
    }

    @GetMapping("show/{id}")
    public String show(Map<String, Object> map, @PathVariable("id") Integer id) {
        ExperienceDatabase ed = experienceDatabaseService.findOneById(id);
        map.put("ed", ed);
        return "search_jysjk/show";
    }
}
