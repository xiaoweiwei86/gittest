package com.chl.applet.service.impl;

import com.chl.applet.dao.CommentDao;
import com.chl.applet.entity.Comment;
import com.chl.applet.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentDao commentDao;

    @Override
    public List<Comment> findAll() {
        return commentDao.selectAll();
    }

    @Override
    public List<Comment> findByUserId(Integer userId) {
        return commentDao.selectByUserId(userId);
    }

    @Override
    public List<Comment> findByEdId(Integer edId) {
        return commentDao.selectByEdId(edId);
    }

    @Override
    public List<Comment> findByDailyId(Integer dailyId) {
        return commentDao.selectByDailyId(dailyId);
    }

    @Override
    public List<Comment> findHandoverOrderId(Integer handoverOrderId) {
        return commentDao.selectByHandoverOrderId(handoverOrderId);
    }

    @Override
    public Comment findOne(Integer id) {
        return commentDao.selectOne(id);
    }

    @Override
    public void add(Comment comment) {
        comment.setCreateTime(new Date());
        commentDao.insert(comment);
    }

    @Override
    public void removeByEdId(Integer edId) {
        commentDao.deleteByEdId(edId);
    }

    @Override
    public void removeByDailyId(Integer dailyId) {
        commentDao.selectByDailyId(dailyId);
    }
}
