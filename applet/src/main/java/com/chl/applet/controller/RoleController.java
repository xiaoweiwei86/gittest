package com.chl.applet.controller;

import com.chl.applet.entity.Role;
import com.chl.applet.service.RoleService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private RoleService roleService;

    private static final Integer pageSize = 10;
    private static final String orderBy = "id desc";

    @RequestMapping("to_add")
    public String toAdd() {
        return "role/role_add";
    }

    @RequestMapping("list")
    public String list(Map<String, Object> map, @RequestParam(defaultValue = "1") Integer pageNum) {
        PageHelper.startPage(pageNum, pageSize, orderBy);
        List<Role> roles = roleService.findAll();
        PageInfo<Role> page = new PageInfo<>(roles);
        map.put("page",page);
        map.put("roles", roles);
        return "role/role_list";
    }

    @RequestMapping("add")
    public String add(Role role) {
        roleService.add(role);
        return "redirect:list";
    }

    @RequestMapping("to_edit")
    public String toEdit(Map<String, Object> map, Integer id) {
        Role role = roleService.findById(id);
        map.put("role", role);
        return "role/role_edit";
    }


    @RequestMapping("edit")
    public String edit(Role role) {
        roleService.edit(role);
        return "redirect:to_edit?id="+role.getId();
    }

    @RequestMapping("remove")
    public String remove(Integer id) {
        roleService.remove(id);
        return "redirect:list";
    }
}
