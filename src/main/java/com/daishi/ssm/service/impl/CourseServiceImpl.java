package com.daishi.ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daishi.ssm.dao.CourseModelMapper;
import com.daishi.ssm.pojo.CourseModel;
import com.daishi.ssm.service.ICourseService;

@Service
public class CourseServiceImpl implements ICourseService {
    @Autowired
    private CourseModelMapper csModel;

    @Override
    public int addCouese(CourseModel cs) {
        // TODO Auto-generated method stub
        return csModel.insert(cs);
    }

}
