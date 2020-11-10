package com.daishi.ssm.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.daishi.ssm.pojo.ManagerModel;
import com.daishi.ssm.service.impl.ManagerServiceImpl;
import com.daishi.ssm.utils.DBrecord;
import com.daishi.ssm.utils.Unlogin;

@Controller
@RequestMapping("m")
public class WangManagerController {
    @Autowired
    private ManagerServiceImpl mservice;

    @Unlogin
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(ManagerModel ml, HttpSession session,
                        HttpServletResponse ps) {
        // 1-先判断输入不能为空
        if (StringUtils.isEmpty(ml.getLoginname()) || StringUtils.isEmpty(ml.getPwd())) {
            DBrecord.showInfo(ps, "输入不能为空，请重新输入！", "/page/index.jsp");
            return null;
        }
        // 2-判断账号密码输入是否正确
        ManagerModel m = mservice.login(ml);

        if (m != null) {
            session.setAttribute("m", m);
            return "adminIndex";
        } else {
            // 2-1输入不正确
            DBrecord.showInfo(ps, "用户密码输入不正确！", "/page/index.jsp");
            return null;
        }
    }

    //修改密码
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public String updataManagerPassword(String managerpwd1, String managerpwd2,
                                        HttpSession session, HttpServletResponse ps) {
        ManagerModel m = (ManagerModel) session.getAttribute("m");
        String pwd = m.getPwd();
        if (!managerpwd1.equals(pwd)) {
            DBrecord.showInfo(ps, "密码错误", "/page/adminInfo.jsp");
            return null;
        }
        m.setPwd(managerpwd2);
        mservice.updataManagerPassword(m);
        session.setAttribute("m", m);
        DBrecord.showInfo(ps, "修改成功", "/page/adminInfo.jsp");
        return null;
    }

    //退出系统
    @RequestMapping("/exit")
    public String exitManager(HttpSession session, SessionStatus status) {
        //清空session
        session.invalidate();
        //springsession
        status.setComplete();
        System.out.println("退出成功了");

        return "index";

    }

    //文件上传
    @RequestMapping(value = "/fileupload", method = RequestMethod.POST)
    public ModelAndView fileUpLoad(MultipartFile ml, HttpServletRequest rquest,
                                   HttpSession session, ModelAndView model) throws IOException {
        ManagerModel manager = (ManagerModel) session.getAttribute("m");
        ManagerModel manager1 = mservice.fileUpLoad(ml, manager);
        model.addObject("m", manager1);
        model.setViewName("adminInfo");
        return model;

    }


}
