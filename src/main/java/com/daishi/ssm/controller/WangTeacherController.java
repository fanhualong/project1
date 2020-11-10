package com.daishi.ssm.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.daishi.ssm.pojo.TeacherModel;
import com.daishi.ssm.service.impl.XieTeacherServiceImpl;
import com.daishi.ssm.utils.DBrecord;
import com.daishi.ssm.utils.Unlogin;


@Controller
@RequestMapping("t")
public class WangTeacherController {
    @Autowired
    private XieTeacherServiceImpl service;

    @Unlogin
    @RequestMapping(value = "/	", method = RequestMethod.POST)
    public String login(TeacherModel tl, HttpSession session,
                        HttpServletResponse ps) {
        // 1-先判断输入不能为空
        if (StringUtils.isEmpty(tl.getLoginname()) || StringUtils.isEmpty(tl.getPwd())) {
            DBrecord.showInfo(ps, "输入不能为空，请重新输入！", "/page/index.jsp");
            return null;
        }

        // 2-判断账号密码输入是否正确

        TeacherModel t = service.login(tl);

        // 2-2输入正确
        if (t != null) {
            // 将对象放入session中
            session.setAttribute("t", t);
            return "teacherInfo";
        } else {
            // 2-1输入不正确
            DBrecord.showInfo(ps, "用户密码输入不正确！", "/page/index.jsp");
            return null;
        }

    }
}
