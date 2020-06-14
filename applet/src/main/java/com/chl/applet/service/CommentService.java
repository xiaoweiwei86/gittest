package com.chl.applet.service;

import com.chl.applet.entity.Comment;

import java.util.List;

public interface CommentService {
    List<Comment> findAll();
    List<Comment> findByUserId(Integer userId);
    List<Comment> findByEdId(Integer edId);
    List<Comment> findByDailyId(Integer dailyId);
    List<Comment> findHandoverOrderId(Integer handoverOrderId);
    Comment findOne(Integer id);
    void add(Comment comment);
    void removeByEdId(Integer edId);
    void removeByDailyId(Integer dailyId);
}
