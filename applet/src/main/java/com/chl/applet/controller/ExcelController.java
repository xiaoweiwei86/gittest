package com.chl.applet.controller;


import com.chl.applet.entity.Daily;
import com.chl.applet.entity.User;
import com.chl.applet.service.DailyService;
import com.chl.applet.service.UserService;
import com.chl.applet.util.ExcelUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ExcelController {
    @Autowired
    UserService userService;
    @Autowired
    DailyService dailyService;
    private static String sheetName = "日志列表";
    private static String fileName = "daily.xls";

    public static List<List<String>> excel(List<Daily> dailyList) throws IOException {
        List<List<String>> excelData = new ArrayList<>();
        SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日");
        List<String> head = new ArrayList<>();
        head.add("日期");
        head.add("姓名");
        head.add("工作事项");
        head.add("完成情况");
        excelData.add(head);
        for (int i = 0; i < dailyList.size(); i++) {
            List<String> data = new ArrayList<>();
            data.add(format.format(dailyList.get(i).getCreateTime()));
            data.add(dailyList.get(i).getUser().getRealName());
            data.add(dailyList.get(i).getItems());
            data.add(dailyList.get(i).getPerformance());
            excelData.add(data);
        }
        return excelData;
    }

    @RequestMapping("/dailyAll")
    public void excelDownload(HttpServletResponse response) throws IOException {
        List<Daily> dailyList = dailyService.findAll();
        ExcelUtil.exportExcel(response, excel(dailyList), sheetName, fileName, 15);
    }

    @RequestMapping("/dailySearch")
    public void excelDownload(@RequestParam String realName, @RequestParam String startTime, @RequestParam String endTime, HttpServletResponse response) throws IOException {
        List<Daily> dailyList;
        if (realName.trim() != "") {
            List<User> users = userService.findByRealName(realName);
            Integer[] userIds;
            if (!users.isEmpty()) {
                userIds = new Integer[users.size()];
                for (int i = 0; i < users.size(); i++) {
                    userIds[i] = users.get(i).getId();
                }
            } else {
                userIds = new Integer[1];
                userIds[0] = 0;
            }
            dailyList = dailyService.searchByKeywords(userIds, startTime, endTime);
        } else {

            dailyList = dailyService.searchByKeywords(null, startTime, endTime);

        }
        ExcelUtil.exportExcel(response, excel(dailyList), sheetName, fileName, 15);
    }

    @RequestMapping("/dailyMyself")
    public void excelDownload(@RequestParam String startTime, @RequestParam String endTime, HttpSession session, HttpServletResponse response) throws IOException {
        User user = (User) session.getAttribute("USER");
        Integer[] userIds = new Integer[1];
        userIds[0] = user.getId();
        List<Daily> dailyList = dailyService.searchByKeywords(userIds, startTime, endTime);
        ExcelUtil.exportExcel(response, excel(dailyList), sheetName, fileName, 15);
    }
}
