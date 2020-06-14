package com.chl.applet.controller;


import com.chl.applet.entity.DailyDrafts;
import com.chl.applet.entity.User;
import com.chl.applet.service.DailyDraftsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/drafts")
public class DailyDraftsController {
    @Autowired
    private DailyDraftsService dailyDraftsService;

    @RequestMapping("find")
    @ResponseBody
    public DailyDrafts findNew(HttpSession session){
        User user =(User) session.getAttribute("USER");
        return  dailyDraftsService.findOne(user.getId());
    }

    @RequestMapping("add")
    @ResponseBody
    public void add(HttpSession session,DailyDrafts dailyDrafts){
        User user =(User) session.getAttribute("USER");
        DailyDrafts drafts = dailyDraftsService.findOne(user.getId());
        dailyDrafts.setUserId(user.getId());
        if(drafts==null){
            dailyDraftsService.add(dailyDrafts);
        }else {
            dailyDraftsService.update(dailyDrafts);
        }
    }
}
