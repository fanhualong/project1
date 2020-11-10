package com.daishi.ssm.service.impl;

import java.io.File;
import java.util.ResourceBundle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.daishi.ssm.dao.TeacherModelMapper;
import com.daishi.ssm.pojo.TeacherModel;
import com.daishi.ssm.service.FanTeacherService;

@Service
@Transactional
public class FanTeacherServiceImpl implements FanTeacherService {

    @Autowired
    private TeacherModelMapper teacherModelMapper;

    /**
     * 修改老师资料-密码
     * version=1.0
     */
    @Override
    public void updataTeacherPassword(TeacherModel teacher) {
        teacherModelMapper.updateByPrimaryKey(teacher);
        System.out.println("service层...");
    }

    public void addTeacher(TeacherModel model) {

        teacherModelMapper.insert(model);
    }

    @Override
    public TeacherModel fileUpLoad(MultipartFile f1, TeacherModel teacher) throws Exception {
        System.out.println("f1=" + f1);

        ResourceBundle bd = ResourceBundle.getBundle("url");
        String path = bd.getString("img.url");
        //获取文件名称
        String name = f1.getOriginalFilename();

        System.out.println("name=" + name);

        String fullPath = path + name;
        System.out.println("fullPath=" + fullPath);
        File f = new File(fullPath);
        //如果文件不存在，就创建
        if (!f.exists()) {
            f.createNewFile();
        }
        f1.transferTo(f);

        String path1 = "/page/images/touxiang/";
        String fullPath1 = path1 + name;

        System.out.println("fullPath1=" + fullPath1);
        teacher.setUrl(fullPath1);
        teacherModelMapper.updateByPrimaryKey(teacher);
        return teacher;
    }

}
