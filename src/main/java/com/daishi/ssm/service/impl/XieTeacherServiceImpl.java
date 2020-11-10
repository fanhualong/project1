package com.daishi.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.daishi.ssm.dao.TeacherModelMapper;
import com.daishi.ssm.pojo.TeacherModel;
import com.daishi.ssm.service.XieTeacherService;

@Service
@Transactional
public class XieTeacherServiceImpl implements XieTeacherService {

    @Autowired
    private TeacherModelMapper teacherModelMapper;

    @Override
    public TeacherModel login(TeacherModel tl) {
        TeacherModel teacher = teacherModelMapper.selectfindByName(tl);
        return teacher;
    }

    @Override


    public void addTeacher(TeacherModel model) {

        teacherModelMapper.insert(model);
    }

    public List<TeacherModel> selectTeacher(String loginname) {
        return teacherModelMapper.selectTeacher(loginname);

    }

}
