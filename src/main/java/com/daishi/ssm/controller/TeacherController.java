package com.daishi.ssm.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.daishi.ssm.pojo.TeacherModel;
import com.daishi.ssm.service.impl.XieTeacherServiceImpl;

@Controller
@RequestMapping("teacher")
public class TeacherController {
    @Autowired
    private XieTeacherServiceImpl teacherServiceImpl;

    public XieTeacherServiceImpl getTeacherServiceImpl() {
        return teacherServiceImpl;
    }

    /**
     * 修改老师资料-密码 version=1.0
     * 问题：跳转页面

     @RequestMapping(value = "/updata", method = RequestMethod.POST)
     public String updataTeacherPassword(
     @RequestParam(name = "teacherpwd1") String oldpsw,
     @RequestParam(name = "teacherpwd2") String newpsw1,
     HttpSession session) {
     TeacherModel teacher1 =new TeacherModel();
     teacher1.setId(1);
     teacher1.setLoginname("汪老师");
     teacher1.setPwd("456789");
     teacher1.setNicename("张思");
     teacher1.setUrl("666");
     teacher1.setCreatetime(new Date());
     teacher1.setEnable(1);
     teacher1.setType(1);
     session.setAttribute("msg", teacher1);
     System.out.println(oldpsw + ".." + newpsw1);
     // 1-先查询原密码是否正确--从session中取出，判断
     // msg为存入登录的对象
     TeacherModel teacher = (TeacherModel) session.getAttribute("msg");
     String pwd = teacher.getPwd();
     // 2-1错误，返回提示修改错误
     if (!oldpsw.equals(pwd)) {
     System.out.println("密码错误");
     return "";
     }
     // 2-2正确，拿着新密码进行修改，修改完成返回提示
     //将新密码存入从session中取出的对象中，这个session域中的对象还改不改呢？
     teacher.setPwd(newpsw1);
     //将修改的对象也存入sess中
     session.setAttribute("msg", teacher);
     System.out.println("什么鬼："+teacher);
     teacherServiceImpl.updataTeacherPassword(teacher);
     System.out.println("修改成功");
     return "teacherInfo";
     }
     */


}
