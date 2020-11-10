package com.daishi.ssm.utils;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class DBrecord {
    public static String showInfo(HttpServletResponse response, String info_str, String url) {
        PrintWriter pout = null;
        try {
            response.setContentType("text/html;charset=UTF-8");
            response.setCharacterEncoding("UTF-8");
            pout = response.getWriter();
            pout.print("<script charset=\"UTF-8\" >alert('" + info_str + "');location.href='" + url + "';</script>");
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (pout != null) {
                pout.close();
            }
        }
        return null;
    }
}
