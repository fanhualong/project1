package com.daishi.ssm.service;

import org.springframework.web.multipart.MultipartFile;

import com.daishi.ssm.pojo.TeacherModel;

public interface FanTeacherService {
    public void updataTeacherPassword(TeacherModel teacher);

    TeacherModel fileUpLoad(MultipartFile f1, TeacherModel teacher) throws Exception;
}
