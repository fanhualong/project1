package com.daishi.ssm.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.daishi.ssm.pojo.TeacherModel;
import com.daishi.ssm.service.impl.FanTeacherServiceImpl;
import com.daishi.ssm.utils.DBrecord;

@Controller
@RequestMapping("teacher")
public class FanTeacherController {
    @Autowired
    private FanTeacherServiceImpl teacherServiceImpl;

    public FanTeacherServiceImpl getTeacherServiceImpl() {
        return teacherServiceImpl;
    }

    /**
     * 修改老师资料-密码 version=1.0 问题：跳转页面
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public String updataTeacherPassword(String teacherpwd1, String teacherpwd2,
                                        HttpSession session, HttpServletResponse ps) {
        /*
         * TeacherModel teacher1 = new TeacherModel(); teacher1.setId(1);
         * teacher1.setLoginname("汪老师"); teacher1.setPwd("456789");
         * teacher1.setNicename("张思"); teacher1.setUrl("666");
         * teacher1.setCreatetime(new Date()); teacher1.setEnable(1);
         * teacher1.setType(1); session.setAttribute("msg", teacher1);
         */
        System.out.println("旧密码：" + teacherpwd1 + ".." + "新密码：" + teacherpwd2);
        // 1-先查询原密码是否正确--从session中取出，判断
        // msg为存入登录的对象
        TeacherModel teacher = (TeacherModel) session.getAttribute("t");
        String pwd = teacher.getPwd();
        // 2-1错误，返回提示修改错误
        if (!teacherpwd1.equals(pwd)) {
            DBrecord.showInfo(ps, "密码错误", "/page/teacherInfo.jsp");
            return null;
        }
        // 2-2正确，拿着新密码进行修改，修改完成返回提示
        // 将新密码存入从session中取出的对象中，这个session域中的对象还改不改呢？
        teacher.setPwd(teacherpwd2);
        // 将修改的teacher对象进行更新
        teacherServiceImpl.updataTeacherPassword(teacher);
        // 将修改的对象也存入session中
        session.setAttribute("t", teacher);
        DBrecord.showInfo(ps, "修改成功", "/page/teacherInfo.jsp");
        return null;
    }

    /**
     * 老师退出系统
     *
     * @return version=1.0 实验时，第一次点确认退出，然后直接返回不刷新，再次点击，选择取消，还是会退出
     * 原因：第一次已经把href赋值了，第二次也直接用， 可以不用管这个bug
     */
    @RequestMapping("/exit")
    public String exitTeacherController(HttpSession session, SessionStatus status) {
        // 直接清空session
        session.invalidate();
        status.setComplete();
        System.out.println("成功退出！");
        return "redirect:/page/index.jsp";
    }

    /**
     * 文件上传功能
     *
     * @return
     */
    @RequestMapping(value = "/fileupload", method = RequestMethod.POST)
    public ModelAndView fileUpLoad(MultipartFile f1, HttpServletRequest rquest,
                                   HttpSession session, ModelAndView model) throws Exception {
        // 获取session中的对象
        TeacherModel teacher = (TeacherModel) session.getAttribute("t");
        // 接收新的路径
        TeacherModel teacher1 = teacherServiceImpl.fileUpLoad(f1, teacher);
        model.addObject("t", teacher1);
        model.setViewName("teacherInfo");
        return model;
    }

}
