package com.daishi.ssm.service;

import java.util.List;

import com.daishi.ssm.pojo.TeacherModel;

public interface XieTeacherService {

    public TeacherModel login(TeacherModel tl);

    public void addTeacher(TeacherModel model);

    public List<TeacherModel> selectTeacher(String loginname);
}
