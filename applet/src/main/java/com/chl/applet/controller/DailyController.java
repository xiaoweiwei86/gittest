package com.chl.applet.controller;


import com.chl.applet.entity.Daily;
import com.chl.applet.entity.User;
import com.chl.applet.service.DailyDraftsService;
import com.chl.applet.service.DailyService;
import com.chl.applet.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/daily")
public class DailyController {
    @Autowired
    private DailyService dailyService;
    @Autowired
    private UserService userService;
    @Autowired
    private DailyDraftsService dailyDraftsService;
    private static final Integer pageSize = 20;
    private static final String orderBy = "create_time desc";

    @RequestMapping("list")
    public String list(Map<String, Object> map, @RequestParam(defaultValue = "1") Integer pageNum) {
        PageHelper.startPage(pageNum, pageSize, orderBy);
        List<Daily> dailyList = dailyService.findAll();
        PageInfo<Daily> page = new PageInfo<>(dailyList);
        map.put("list", dailyList);
        map.put("page", page);
        return "daily/daily_list";
    }

    @RequestMapping("myself")
    public String myself(Map<String, Object> map, HttpSession session, @RequestParam(defaultValue = "1") Integer pageNum) {
        PageHelper.startPage(pageNum, pageSize, orderBy);
        User user = (User) session.getAttribute("USER");
        List<Daily> dailyList = dailyService.findByUserId(user.getId());
        PageInfo<Daily> page = new PageInfo<>(dailyList);
        map.put("list", dailyList);
        map.put("page", page);
        return "daily/daily_list_myself";
    }

    @RequestMapping("find_one")
    public String findOne(Map<String, Object> map, @RequestParam Integer id) {
        Daily daily = dailyService.findById(id);
        map.put("daily", daily);
        return "daily/daily_show";
    }

    @RequestMapping("to_add")
    public String toAdd() {
        return "daily/daily_add";
    }

    @RequestMapping("to_edit")
    public String toEdit(Map<String, Object> map, @RequestParam Integer id) {
        Daily daily = dailyService.findById(id);
        map.put("daily", daily);
        return "daily/daily_edit";
    }

    @RequestMapping("edit")
    public String edit(Daily daily) {
        dailyService.update(daily);
        return "redirect:myself" ;
    }

    @RequestMapping("add")
    public String add(Daily daily) {
        dailyService.add(daily);
        dailyDraftsService.delete(daily.getUserId()); //提交日志删除草稿箱
        return "redirect:myself";
    }

    @RequestMapping("remove")
    public String remove(@RequestParam Integer id) {
        dailyService.delete(id);
        return "redirect:myself";
    }

    @RequestMapping("search")
    public String search(Map<String, Object> map, @RequestParam String realName, @RequestParam(defaultValue = "1") Integer pageNum, @RequestParam String startTime, @RequestParam String endTime) {
        if (!realName.trim().equals("")) {
            List<User> users = userService.findByRealName(realName);
            Integer[] userIds;
            System.out.println(users);
            if (!users.isEmpty()) {
                userIds = new Integer[users.size()];
                for (int i = 0; i < users.size(); i++) {
                    userIds[i] = users.get(i).getId();
                }
            } else {
                userIds = new Integer[1];
                userIds[0] = 0;
            }
            PageHelper.startPage(pageNum, pageSize, orderBy);
            List<Daily> dailyList = dailyService.searchByKeywords(userIds, startTime, endTime);
            PageInfo<Daily> page = new PageInfo<>(dailyList);
            map.put("list", dailyList);
            map.put("page", page);
            map.put("flag", 1);
            map.put("realName", realName);
            map.put("startTime", startTime);
            map.put("endTime", endTime);
        } else {
            PageHelper.startPage(pageNum, pageSize, orderBy);
            List<Daily> dailyList = dailyService.searchByKeywords(null, startTime, endTime);
            PageInfo<Daily> page = new PageInfo<>(dailyList);
            map.put("list", dailyList);
            map.put("page", page);
            map.put("flag", 1);
            map.put("realName", realName);
            map.put("startTime", startTime);
            map.put("endTime", endTime);
        }
        return "daily/daily_list";
    }

    @RequestMapping("searchByTime")
    public String searchByTime(Map<String, Object> map, HttpSession session, @RequestParam(defaultValue = "1") Integer pageNum, @RequestParam String startTime, @RequestParam String endTime) {
        User user = (User) session.getAttribute("USER");
        Integer[] userIds = new Integer[1];
        userIds[0] = user.getId();
        PageHelper.startPage(pageNum, pageSize, orderBy);
        List<Daily> dailyList = dailyService.searchByKeywords(userIds, startTime, endTime);
        PageInfo<Daily> page = new PageInfo<>(dailyList);
        map.put("list", dailyList);
        map.put("page", page);
        map.put("flag", 1);
        map.put("startTime", startTime);
        map.put("endTime", endTime);
        return "daily/daily_list_myself";
    }
}
