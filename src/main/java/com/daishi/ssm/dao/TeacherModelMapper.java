package com.daishi.ssm.dao;

import java.util.List;

import com.daishi.ssm.pojo.TeacherModel;

public interface TeacherModelMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TeacherModel record);

    int insertSelective(TeacherModel record);

    TeacherModel selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TeacherModel record);

    int updateByPrimaryKey(TeacherModel record);

    TeacherModel selectfindByName(TeacherModel tl);

    List<TeacherModel> selectTeacher(String loginname);

}