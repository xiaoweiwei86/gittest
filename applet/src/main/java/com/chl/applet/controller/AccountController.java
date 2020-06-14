package com.chl.applet.controller;


import com.chl.applet.entity.Team;
import com.chl.applet.entity.User;
import com.chl.applet.service.ExperienceDatabaseService;
import com.chl.applet.service.UserService;
import com.chl.applet.util.TeamUtil;
import com.chl.applet.util.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletMapping;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class AccountController {
    @Autowired
    private UserService userService;
    @Autowired
    private ExperienceDatabaseService experienceDatabaseService;

    @RequestMapping("to_login")
    public String toLogin(Map<String, Object> map, @RequestParam(defaultValue = "0") Integer edId) {
        map.put("edId", edId);
        return "login";
    }

    @RequestMapping("to_search_login")
    public String toSearchLogin() {
        return "search_jysjk/search_login";
    }

    /**
     * 登录，将用户信息保存到session中。
     *       不同角色登录跳转不同页面
     * @param map
     * @param session
     * @param username
     * @param password
     * @param edId
     * @return
     */
    @RequestMapping("login")
    public String login(Map<String, Object> map, HttpSession session, @RequestParam String username, @RequestParam String password, @RequestParam(defaultValue = "0") Integer edId) {
        User user = userService.findByLoginName(username);
        if (user != null) {
            if (MD5Utils.validate(password, user.getPassword())) {
                session.setAttribute("USER", user);
                List<Team> teams = TeamUtil.getTeamList();
                session.setAttribute("teams", teams);
                Integer teamId = null;
                //判断是否是管理员登录，若不是，按照部门搜索未审核数量，如是则搜索到全部未审核数量。
                if (!user.getRole().getNickName().equals("超级管理员")) {
                    teamId = user.getTeamId();
                }
                Integer num = experienceDatabaseService.findCheckNum(teamId);
                session.setAttribute("NUM", num);
                if (edId != 0) {
                    return "redirect:/show/" + edId;
                } else if (user.getRole().getNickName().equals("经验数据库管理员")) {
                    return "redirect:/ed/myself?userId=" + user.getId();
                } else if (user.getTeam().equals("技术管理部")) {
                    return "redirect:/daily/myself";
                } else {
                    return "redirect:/user/self?id=" + user.getId();
                }
            } else {
                map.put("msg", "密码错误！");
                map.put("edId", edId);
                return "login";
            }
        } else {
            map.put("msg", "用户不存在！");
            map.put("edId", edId);
            return "login";
        }
    }

    @RequestMapping("search_login")
    @ResponseBody
    public String searchLogin(HttpSession session, @RequestParam String username, @RequestParam String password) {
        User user = userService.findByLoginName(username);
        if (user != null) {
            if (MD5Utils.validate(password, user.getPassword())) {
                session.setAttribute("USER", user);
                return "OK";
            }else {
                return "NO_PWD";
            }
        }else {
            return "NO_USER";
        }
    }

    /**
     * 退出系统，清空session、更新用户退出的时间。
     *
     * @param session
     * @return
     */
    @RequestMapping("quit")
    public String quit(HttpSession session) {
        User user = (User) session.getAttribute("USER");
        if (user != null) {
            userService.quit(user);
            session.setAttribute("USER", null);
            session.setAttribute("teams", null);
        }
        return "redirect:to_login";
    }

    /**
     * 搜索页面退出
     * @param request
     * @return
     */
    @RequestMapping("search_quit")
    public String searchQuit(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("USER");
        if (user != null) {
            userService.quit(user);
            request.getSession().setAttribute("USER", null);
            request.getSession().setAttribute("teams", null);
        }
        return "redirect:search_home";
    }
    /**
     * 注册页面，将部门信息保存到session中。
     *
     * @param session
     * @return
     */
    @RequestMapping("to_register")
    public String toRegister(HttpSession session) {
        List<Team> teams = TeamUtil.getTeamList();
        session.setAttribute("teams", teams);
        return "register";
    }

    /**
     * 注册模块，注册成功之后，跳转到登录界面
     *
     * @param map
     * @param user
     * @return
     */
    @RequestMapping("register")
    public String register(Map<String, Object> map, User user) {
        String flag = isUsername(user.getUsername());
        String password=user.getPassword();
        String username=user.getUsername();
        if (flag .equals("0")) {
            userService.add(user);
            return "redirect:login?username="+username+"&password="+password;
        } else {
            map.put("msg", "用户已存在!");
            return "register";
        }
    }

    /**
     * 检测用户是否存在.
     *
     * @param username
     * @return
     */
    @RequestMapping("isUsername")
    @ResponseBody
    public String isUsername(@RequestParam String username) {
        User loginName = userService.findByLoginName(username);
        String flag;
        if (loginName == null) {
            flag = "0";//若没有查询到返回结果为0
        } else {
            flag = "1";//若查询到返回结果为1;
        }
        return flag;
    }
}
