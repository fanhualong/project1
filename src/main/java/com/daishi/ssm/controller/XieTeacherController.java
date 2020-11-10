package com.daishi.ssm.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.daishi.ssm.pojo.TeacherModel;
import com.daishi.ssm.service.impl.XieTeacherServiceImpl;
import com.daishi.ssm.utils.DBrecord;

@Controller
@RequestMapping("admin")

public class XieTeacherController {
    @Autowired
    private XieTeacherServiceImpl teacherServiceImpl;


    @RequestMapping(value = "/addTeacher", method = RequestMethod.POST)
    public String addTeacher(TeacherModel model, HttpServletResponse response) {
        model.setUrl("/page/images/touxiang/1.jpg");
        model.setCreatetime(new Date());
        model.setEnable(1);
        model.setType(1);
        teacherServiceImpl.addTeacher(model);
        //DBrecord.showInfo(response, "添加成功", "/selectTeacher.do");
        return "redirect:/admin/selectAllTeacher.do";
    }

    @RequestMapping(value = "/selectTeacher", method = RequestMethod.POST)
    public String selectTeacher(TeacherModel teacher, Model model) {
        System.out.println(teacher.getLoginname());
        List<TeacherModel> list = teacherServiceImpl.selectTeacher(teacher.getLoginname());
        model.addAttribute("list", list);
        System.out.println(list.size());
        return "adminIndex";
    }

    @RequestMapping(value = "/selectAllTeacher", method = RequestMethod.GET)
    public String selectAllTeacher(TeacherModel teacher, Model model) {
        List<TeacherModel> list = teacherServiceImpl.selectTeacher(teacher.getLoginname());
        model.addAttribute("list", list);
        System.out.println(list.size());
        return "adminIndex";
    }


}
