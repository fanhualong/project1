package com.daishi.ssm.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

public class LoginInterceptorr extends HandlerInterceptorAdapter {
    @Override
    public void afterCompletion(HttpServletRequest arg0,
                                HttpServletResponse arg1, Object arg2, Exception arg3)
            throws Exception {
        // TODO Auto-generated method stub

    }

    @Override
    public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
                           Object arg2, ModelAndView arg3) throws Exception {
        // TODO Auto-generated method stub

    }

    // 之前拦截
    @Override
    public boolean preHandle(HttpServletRequest req, HttpServletResponse resp,
                             Object obj) throws Exception {

        HandlerMethod h = (HandlerMethod) obj;
        Object o = h.getMethodAnnotation(Unlogin.class);
        if (o != null) {// 没有这个注解
            return true;

        } else {// 有注解
            Object obj1 = WebUtils.getSessionAttribute(req, "t");
            Object obj2 = WebUtils.getSessionAttribute(req, "m");
            if (obj1 == null && obj2 == null) {
                resp.sendRedirect("/page/index.jsp");
                return false;
            } else { // 登录了
                return true;
            }
        }

    }

}
