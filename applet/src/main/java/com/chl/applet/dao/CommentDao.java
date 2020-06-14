package com.chl.applet.dao;

import com.chl.applet.entity.Comment;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentDao {
   List<Comment> selectAll();
   List<Comment> selectByUserId(Integer userId);
   List<Comment> selectByEdId(Integer edId);
   List<Comment> selectByDailyId(Integer dailyId);
   List<Comment> selectByHandoverOrderId(Integer handoverOrderId);
   Comment selectOne(Integer id);
   void insert(Comment comment);
   void deleteByEdId(Integer edId);
   void deleteByDailyId(Integer dailyId);
}
