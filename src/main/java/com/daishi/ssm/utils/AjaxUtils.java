package com.daishi.ssm.utils;


import java.io.IOException;

import javax.servlet.http.HttpServletResponse;


public class AjaxUtils {
    public static void ajaxJson(String jsonString, HttpServletResponse response) {
        ajax(jsonString, "application/json", response);
    }

    // ajax 杈撳嚭鏂囨湰
    public static void ajaxText(String text, HttpServletResponse response) {
        ajax(text, "text/plain", response);
    }

    // ajax 杈撳嚭HTML
    public static void ajaxHtml(String html, HttpServletResponse response) {
        ajax(html, "text/html", response);
    }

    // ajax 杈撳嚭XML
    public static void ajaxXml(String xml, HttpServletResponse response) {
        ajax(xml, "text/xml", response);
    }

    public static void ajax(String content, String type,
                            HttpServletResponse response) {
        try {
            response.setContentType(type + ";charset=UTF-8");
            response.setHeader("Pragma", "No-cache");
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expires", 0);
            response.getWriter().write(content);
            response.getWriter().flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
