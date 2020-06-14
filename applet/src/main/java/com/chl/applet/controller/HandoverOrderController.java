package com.chl.applet.controller;

import com.chl.applet.entity.Asset;
import com.chl.applet.entity.Comment;
import com.chl.applet.entity.HandoverOrder;
import com.chl.applet.entity.User;
import com.chl.applet.service.*;
import com.chl.applet.util.TeamUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/handover_order")
public class HandoverOrderController {
    @Value("${asset-url}")
    private String assetUrl;
    @Autowired
    private HandoverOrderService handoverOrderService;
    @Autowired
    private AssetService assetService;
    @Autowired
    private MailService mailService;
    @Autowired
    private UserService userService;
    @Autowired
    private CommentService commentService;
    private static final Integer pageSize = 20;
    private static final String orderBy = "add_time desc";

    @RequestMapping("list")
    public String list(Map<String, Object> map, @RequestParam(defaultValue = "1") Integer pageNum) {
        PageHelper.startPage(pageNum, pageSize, orderBy);
        List<HandoverOrder> list = handoverOrderService.findAll();
        PageInfo<HandoverOrder> page = new PageInfo<>(list);
        map.put("list", list);
        map.put("page", page);
        return "handover_order/handover_order_list";
    }

    @RequestMapping("myself_list")
    public String myselfList(HttpSession session, Map<String, Object> map, @RequestParam(defaultValue = "1") Integer pageNum) {
        User user = (User) session.getAttribute("USER");
        PageHelper.startPage(pageNum, pageSize, orderBy);
        List<HandoverOrder> myselfList = handoverOrderService.findByUserId(user.getId());
        PageInfo<HandoverOrder> page = new PageInfo<>(myselfList);
        map.put("list", myselfList);
        map.put("page", page);
        return "handover_order/handover_order_list_myself";
    }

    @RequestMapping("team_list")
    public String teamList(HttpSession session, Map<String, Object> map, @RequestParam(defaultValue = "1") Integer pageNum) {
        User user = (User) session.getAttribute("USER");
        PageHelper.startPage(pageNum, pageSize, orderBy);
        List<HandoverOrder> list = handoverOrderService.findByTeam(user.getTeam());
        PageInfo<HandoverOrder> page = new PageInfo<>(list);
        map.put("list", list);
        map.put("page", page);
        return "handover_order/handover_order_team_list";
    }

    /**
     * 个人、部门、全部交接单搜索功能
     * @param session
     * @param map
     * @param pageNum
     * @param flag
     * @param assetNumbers
     * @param transferTeam
     * @param acceptTeam
     * @return
     */
    @RequestMapping("search")
    public String search(HttpSession session, Map<String, Object> map, @RequestParam(defaultValue = "1") Integer pageNum, @RequestParam(defaultValue = "0") String flag, @RequestParam String assetNumbers, @RequestParam(defaultValue = "") String transferTeam, @RequestParam String acceptTeam) {
        User user = (User) session.getAttribute("USER");
        Integer[] assetIds = null;
        Integer userId=null;
        if (assetNumbers != "") {
            String[] numbers = assetNumbers.split(","); //将输入编号以,转化为字符串。
            assetIds = new Integer[numbers.length];
            for (int i = 0; i < numbers.length; i++) {
                Asset asset = assetService.findByNumber(numbers[i]); //遍历字符串 通过编号搜索资产信息，将资产ID存入数组assetIds中
                    if (asset != null) {
                        assetIds[i] = asset.getId();
                } else {
                    assetIds[0] = 0;
                }
            }
        }
        if (flag.equals("1")) {
            transferTeam = user.getTeam(); //部门搜索带入移交单位条件搜索
        }
        if(flag.equals("2")){
            userId=user.getId(); //如果是通过个人交接单搜索 需要带入userId条件
        }
        PageHelper.startPage(pageNum, pageSize, orderBy);
        //将用户ID，flag标记 带入搜索，通过不同flag标记搜索不同内容（主要针对部门交接单查询功能）
        List<HandoverOrder> list = handoverOrderService.search(assetIds, transferTeam, acceptTeam, userId,flag);
        PageInfo<HandoverOrder> page = new PageInfo<>(list);
        map.put("list", list);
        map.put("page", page);
        //将搜索关键字带回页面显示
        map.put("assetNumbers", assetNumbers);
        map.put("transferTeam", transferTeam);
        map.put("acceptTeam", acceptTeam);
       //将页面传递是否为搜索后的结果，区分分页跳转路径
        map.put("isSearch", 1);
        map.put("flag",flag);
        //根据不同标记跳转不同页面
        switch (flag) {
            case "1": {
                return "handover_order/handover_order_team_list";
            }
            case "2": {
                return "handover_order/handover_order_list_myself";
            }
            default: {
                return "handover_order/handover_order_list";
            }
        }
    }

    /**
     * 通过资产ID查询交接单
     *
     * @param map
     * @param assetId
     * @return
     */
    @RequestMapping("find_asset_id")
    public String findByAssetId(Map<String, Object> map, @RequestParam Integer assetId) {
        List<HandoverOrder> list = handoverOrderService.findByAssetId(assetId);
        map.put("list", list);
        return "asset/asset_handover_order_list";
    }


    @RequestMapping("to_add")
    public String toAdd() {
        return "handover_order/handover_order_add";
    }

    @RequestMapping("to_add_by_asset")
    public String toAddByAsset(ModelMap modelMap, @RequestParam Integer assetId) {
        Asset asset = assetService.findOne(assetId);
        modelMap.addAttribute("asset", asset);
        return "handover_order/handover_order_by_asset_add";
    }

    @RequestMapping("add")
    public String add(HandoverOrder handoverOrder) {
        handoverOrderService.add(handoverOrder);
        return "redirect:myself_list?userId=" + handoverOrder.getUserId();
    }

    @RequestMapping("find_one")
    public String findOne(Map<String, Object> map, @RequestParam Integer id) {
        HandoverOrder handoverOrder = handoverOrderService.findOne(id);
        List<Comment> commentList = commentService.findHandoverOrderId(id);
        List<Comment> transferComments = new ArrayList<>();
        List<Comment> acceptComments = new ArrayList<>();
        for (Comment comment : commentList) {
            if (comment.getUser().getTeam().equals(handoverOrder.getTransferTeam())) {
                transferComments.add(comment);
            } else if (comment.getUser().getTeam().equals(handoverOrder.getAcceptTeam())) {
                acceptComments.add(comment);
            }
        }
        map.put("handoverOrder", handoverOrder);
        map.put("transferComment", getLastComment(transferComments));
        map.put("acceptComment", getLastComment(acceptComments));
        map.put("commentList", commentList);
        return "handover_order/handover_order_one";
    }

    @RequestMapping("to_edit")
    public String toEdit(Map<String, Object> map, @RequestParam Integer id) {
        HandoverOrder handoverOrder = handoverOrderService.findOne(id);
        map.put("handoverOrder", handoverOrder);
        return "handover_order/handover_order_edit";
    }

    @RequestMapping("edit")
    public String edit(HandoverOrder handoverOrder) {
        handoverOrderService.edit(handoverOrder);
        return "redirect:myself_list?userId=" + handoverOrder.getUserId();
    }

    @RequestMapping("remove")
    public String remove(HttpSession session, @RequestParam Integer id) {
        User user = (User) session.getAttribute("USER");
        handoverOrderService.remove(id);
        return "redirect:myself_list?userId=" + user.getId();
    }

    /**
     * 提交审核进入流程
     *
     * @param id
     * @return
     */
    @RequestMapping("submit_check")
    public String submitCheck(@RequestParam Integer id) {
        HandoverOrder handoverOrder = handoverOrderService.findOne(id);
        handoverOrder.setStatusNo(2);
        handoverOrderService.alterStatusNo(handoverOrder);
        List<User> ministers = getMinister(id);
        for (User minister : ministers) {
            try {
                mailService.sendHtmlMail(minister.getEmail(), "资产交接流程", "<span>您有一条资产交接流程待审核：</span><a href='" + assetUrl + "to_check?id=" + handoverOrder.getId() + "'>点击查看</a>");
            } catch (MessagingException e) {
                e.printStackTrace();
            }
        }
        return "redirect:myself_list?userId=" + handoverOrder.getUserId();
    }

    /**
     * 跳转审核页面，获取签名信息，驳回意见信息
     *
     * @param map
     * @param id
     * @return
     */
    @RequestMapping("to_check")
    public String toCheck(Map<String, Object> map, @RequestParam Integer id) {
        HandoverOrder handoverOrder = handoverOrderService.findOne(id);
        List<Comment> commentList = commentService.findHandoverOrderId(id);
        List<Comment> transferComments = new ArrayList<>();
        List<Comment> acceptComments = new ArrayList<>();
        for (Comment comment : commentList) {
            if (comment.getUser().getTeam().equals(handoverOrder.getTransferTeam())) {
                transferComments.add(comment);
            } else if (comment.getUser().getTeam().equals(handoverOrder.getAcceptTeam())) {
                acceptComments.add(comment);
            }
        }
        map.put("handoverOrder", handoverOrder);
        map.put("transferComment", getLastComment(transferComments));
        map.put("acceptComment", getLastComment(acceptComments));
        map.put("commentList", commentList);
        return "handover_order/handover_order_check";
    }

    /**
     * 移交审核
     *
     * @param session
     * @param id
     * @return
     */
    @RequestMapping("transfer_check")
    public String transferCheck(HttpSession session, @RequestParam Integer id) {
        HandoverOrder handoverOrder = handoverOrderService.findOne(id);
        handoverOrder.setStatusNo(3);
        handoverOrderService.alterStatusNo(handoverOrder);
        User user = (User) session.getAttribute("USER");
        Comment comment = new Comment();
        comment.setUserId(user.getId());
        comment.setHandoverOrderId(id);
        comment.setCreateTime(new Date());
        commentService.add(comment);
        List<User> acceptMinisters = getAcceptMinister(handoverOrder.getAcceptTeam());
        for (User minister : acceptMinisters) {
            try {
                mailService.sendHtmlMail(minister.getEmail(), "资产交接流程", "<span>您有一条资产交接流程待审核：</span><a href='" + assetUrl + "to_check?id=" + handoverOrder.getId() + "'>点击查看</a>");
            } catch (MessagingException e) {
                e.printStackTrace();
            }
        }
        return "redirect:checking_list";
    }

    /**
     * 接收审核
     *
     * @param session
     * @param id
     * @return
     */
    @RequestMapping("accept_check")
    public String acceptCheck(HttpSession session, @RequestParam Integer id) {
        HandoverOrder handoverOrder = handoverOrderService.findOne(id);
        handoverOrder.setStatusNo(4);
        handoverOrderService.alterStatusNo(handoverOrder);
        List<Asset> assets = assetService.findByIds(handoverOrder.getAssetIds());
        for (Asset asset : assets) {
            asset.setUsingTeam(handoverOrder.getAcceptTeam());
            asset.setControlledState("部门保管");
            asset.setCustodian("");
            assetService.edit(asset);//审核通过之后完成使用部门变更，管理状态设置为部门保管，管理人设置为空,更新资产
        }
        User user = (User) session.getAttribute("USER");
        Comment comment = new Comment();
        comment.setUserId(user.getId());
        comment.setHandoverOrderId(id);
        comment.setCreateTime(new Date());
        commentService.add(comment);
        try {
            mailService.sendHtmlMail(handoverOrder.getUser().getEmail(), "资产交接流程", "<span>资产交接流程审核完成：</span><a href='" + assetUrl + "to_check?id=" + handoverOrder.getId() + "'>点击查看</a>");
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return "redirect:checking_list";
    }


    /**
     * 移交/接受未审核列表
     *
     * @param map
     * @param pageNum
     * @return
     */
    @RequestMapping("checking_list")
    public String checkingAcceptList(Map<String, Object> map, @RequestParam(defaultValue = "1") Integer pageNum) {
        Integer[] statusNos = new Integer[]{2, 3};
        PageHelper.startPage(pageNum, pageSize, orderBy);
        List<HandoverOrder> list = handoverOrderService.findByStatusNos(statusNos); //查找进行中 -->接收/移交中
        PageInfo<HandoverOrder> page = new PageInfo<>(list);
        map.put("list", list);
        map.put("page", page);
        return "handover_order/handover_order_checking_list";
    }

    /**
     * 驳回信息添加，并发送邮件给创建者
     * @param comment
     * @return
     */
    @RequestMapping("add_comment")
    public String addComment(Comment comment) {
        commentService.add(comment);
        HandoverOrder handoverOrder = handoverOrderService.findOne(comment.getHandoverOrderId());
        handoverOrder.setStatusNo(0);
        handoverOrderService.alterStatusNo(handoverOrder);
        try {
            mailService.sendHtmlMail(handoverOrder.getUser().getEmail(), "资产交接流程", "<span>您有一条资产交接流程被驳回：</span><a href='" + assetUrl + "find_one?id=" + handoverOrder.getId() + "'>点击查看</a>");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return "redirect:checking_list";
    }

    /**
     * 根据交接单ID获取创建交接单所在部门部长
     *
     * @param id
     * @return
     */
    public List<User> getMinister(@RequestParam Integer id) {
        List<User> userList = new ArrayList<>();
        HandoverOrder handoverOrder = handoverOrderService.findOne(id);
        if (handoverOrder != null) {
            List<User> users = userService.findByTeamId(handoverOrder.getUser().getTeamId());
            if (!users.isEmpty()) {
                for (User user : users) {
                    if (user.getRole().getNickName().equals("部长")) {
                        userList.add(user);
                    }
                }
            }
        }
        return userList;
    }

    /**
     * 根据接收部门查找接收部门部长
     *
     * @param acceptTeam
     * @return
     */
    public List<User> getAcceptMinister(String acceptTeam) {
        List<User> userList = new ArrayList<>();
        Integer teamId = TeamUtil.getTeamIdByName(acceptTeam);
        List<User> list = userService.findByTeamId(teamId);
        if (!list.isEmpty()) {
            for (User user : list) {
                if (user.getRole().getNickName().equals("部长")) {
                    userList.add(user);
                }
            }
        }
        return userList;
    }

    /**
     * 获取最后一次签名信息
     *
     * @param comments
     * @return
     */
    public Comment getLastComment(List<Comment> comments) {
        Comment lastComment = new Comment();
        if (comments.size() == 1) {
            lastComment = comments.get(0);
        } else {
            for (int i = 0; i < comments.size() - 1; i++) {
                if (comments.get(i).getCreateTime().before(comments.get(i + 1).getCreateTime())) {
                    lastComment = comments.get(i + 1);
                }
            }
        }
        return lastComment;
    }

}
