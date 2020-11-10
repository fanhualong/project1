package com.daishi.ssm.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.ModelAndView;

import com.daishi.ssm.pojo.ClassroomModel;
import com.daishi.ssm.pojo.CourseModel;
import com.daishi.ssm.pojo.TClassModel;
import com.daishi.ssm.pojo.TimeModel;
import com.daishi.ssm.service.IZengService;
import com.daishi.ssm.utils.AjaxUtils;
import com.daishi.ssm.utils.DBrecord;
import com.fasterxml.jackson.annotation.JsonFormat.Value;

@Controller
@RequestMapping("course")
public class ZengController {
    @Autowired
    private IZengService serviceImpl;


    /**
     * 1、添加课程的方法
     */
    @RequestMapping(value = "/addCourse", method = RequestMethod.POST)

    public String addCourse(CourseModel cs, HttpServletRequest request, HttpServletResponse response) throws Exception {
        if ("".equals(cs.getTname()) || null == cs.getTname()) {
            DBrecord.showInfo(response, "请输入所要添加的课程名称", "/page/adminSchool.jsp");
            return null;
        }
        cs.setEnable(1);
        cs.setCreattime(new Date());
        int i = serviceImpl.addCouese(cs);
        if (i != 1) {
            DBrecord.showInfo(response, "警告！！！  添加课程失败", "/page/adminSchool.jsp");
            return null;
        } else {
            DBrecord.showInfo(response, "恭喜！！！  添加课程成功", "/page/adminSchool.jsp");

        }


        return "adminSchool";
    }

    /**
     * 1、删除课程
     *
     * @param tname
     * @return
     * @throws Exception
     */
    @RequestMapping("/deleteCourse")
    public String deleteCourse(String tname) throws Exception {
        serviceImpl.deleteCouese(tname);
        return "adminSchool";

    }

    /**
     * 1、修改课程名称
     *
     * @param cs
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/updateCourse", method = RequestMethod.POST)
    public String updateCourse(CourseModel cm, HttpServletResponse response) throws Exception {


        int i = serviceImpl.updateCouese(cm);
        if (i != 1) {
            DBrecord.showInfo(response, "警告！！！  修改课程失败", "/page/adminSchool.jsp");
            return null;
        } else {
            DBrecord.showInfo(response, "恭喜！！！  修改课程成功", "/page/adminSchool.jsp");

        }

        return "adminSchool";

    }

    /**
     * 1、查询全部课程，将数据以json的格式返回给AdminSchool.jsp页面
     */
    @RequestMapping(value = "/selectCourseAll")
    @ResponseBody
    public List<CourseModel> selectCourseAll(Integer n, Integer m) throws Exception {
        //select * from table limit (start-1)*limit,limit; 其中start是页码，limit是每页显示的条数。
        //<!-- nowpage当前页  countPage 总页   counRecord 总记录数-->

        List<CourseModel> list = serviceImpl.selectCourseAll(n, m);

        return list;

    }

    /**
     * 2、班级管理模块，添加班级功能
     */
    @RequestMapping(value = "/addClass", method = RequestMethod.POST)
    public String addClass(TClassModel tc, HttpServletResponse response) throws Exception {
        if ("".equals(tc.getTname()) || null == tc.getTname()) {
            DBrecord.showInfo(response, "请输入所要添加的班级名称", "/page/adminClass.jsp");
            return null;
        }
        tc.setEnable(1);
        tc.setCreatetime(new Date());

        int i = serviceImpl.AddClassModel(tc);
        if (i != 1) {
            DBrecord.showInfo(response, "警告！！！  添加班级失败", "/page/adminClass.jsp");
            return null;
        } else {
            DBrecord.showInfo(response, "恭喜，新班级添加成功！！！", "/page/adminClass.jsp");

        }

        return "adminClass";
    }

    /**
     * 2、删除班级
     *
     * @param tname
     * @return
     * @throws Exception
     */
    @RequestMapping("/deleteClass")
    public String deleteClass(String tname) throws Exception {
        serviceImpl.deleteClass(tname);
        return "adminClass";
    }

    /**
     * 2、修改班级名称
     *
     * @param cs
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/updateClass", method = RequestMethod.POST)
    public String updateClass(TClassModel tc, HttpServletResponse response) throws Exception {


        int i = serviceImpl.updateClass(tc);
        if (i != 1) {
            DBrecord.showInfo(response, "警告！！！  修改课程失败", "/page/adminClass.jsp");
            return null;
        } else {
            DBrecord.showInfo(response, "恭喜！！！  修改课程成功", "/page/adminClass.jsp");

        }

        return "adminClass";

    }

    /**
     * 2、查询全部班级
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectClassAll")
    public void selectClassAll(Integer n, Integer m, HttpServletResponse response) throws Exception {
        List<TClassModel> list1 = serviceImpl.selectClassAll(n, m);

        int count = serviceImpl.numberOfBranches();
        JSONArray jsonArray = JSONArray.fromObject(list1);
        JSONObject object = new JSONObject();
        object.put("data", jsonArray);
        object.put("count", count);

        AjaxUtils.ajaxJson(object.toString(), response);

    }


    /**
     * 3、添加教室的方法，当教室添加成功之后需要请求返回教室列表刷新
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/adminRoom", method = RequestMethod.POST)
    public String adminRoom(ClassroomModel cm, HttpServletResponse response) throws Exception {
        cm.setEnable(1);
        if ("".equals(cm.getRoomname()) || null == cm.getRoomname()) {
            DBrecord.showInfo(response, "请输入所要添加的教室编号", "/page/adminRoom.jsp");
            return null;
        }
        int i = serviceImpl.AddAdminRoom(cm);
        if (i != 1) {
            DBrecord.showInfo(response, "警告！！！  添加教室失败", "/page/adminRoom.jsp");
            return null;
        } else {
            DBrecord.showInfo(response, "恭喜，新教室添加成功！！！", "/page/adminRoom.jsp");
            //selectRoomAll(n,m);//教室添加成功之后重新查询数据库，显示最新教室信息
        }

        return "adminRoom";

    }

    /**
     * 3、删除教室
     *
     * @param roomname
     * @return
     * @throws Exception
     */
    @RequestMapping("/deleteRoom")
    public String deleteRoom(String roomname) throws Exception {
        serviceImpl.deleteRoom(roomname);
        return "adminRoom";
    }

    /**
     * 3、修改教室名称
     *
     * @param cs
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/updateRoom", method = RequestMethod.POST)
    public String updateRoom(ClassroomModel cm, HttpServletResponse response) throws Exception {


        int i = serviceImpl.updateRoom(cm);
        if (i != 1) {
            DBrecord.showInfo(response, "警告！！！  修改课程失败", "/page/adminRoom.jsp");
            return null;
        } else {
            DBrecord.showInfo(response, "恭喜！！！  修改课程成功", "/page/adminRoom.jsp");

        }

        return "adminRoom";

    }

    /**
     * 3、查询所有教室信息，并在页面上展示
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("/selectRoom")
    @ResponseBody
    public List<ClassroomModel> selectRoomAll(Integer n, Integer m) throws Exception {
        List<ClassroomModel> list = serviceImpl.selectRoomAll(n, m);
        return list;

    }

    /**
     * 4、添加上课时间
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/addTimeModel", method = RequestMethod.POST)
    public String addTimeModel(TimeModel tm, HttpServletResponse response) throws Exception {
        if ("".equals(tm.getCreatetime()) || null == tm.getCreatetime()) {
            DBrecord.showInfo(response, "请输入所要添加的上课时间", "/page/adminTime.jsp");
            return null;
        }
        int i = serviceImpl.addTimeModel(tm);
        if (i != 1) {
            DBrecord.showInfo(response, "警告！！！  添加上课时间失败", "/page/adminTime.jsp");
            return null;
        } else if (i == 1) {
            DBrecord.showInfo(response, "恭喜，上课时间添加成功！！！", "/page/adminTime.jsp");

        }
        return "adminTime";


    }

    /**
     * 4.删除上课时间
     *
     * @param createtime
     * @return
     * @throws Exception
     */
    @RequestMapping("/deleteTime")
    public String deleteTime(String createtime) throws Exception {
        serviceImpl.deleteTime(createtime);
        return "adminTime";
    }

    /**
     * 4、修改时间
     *
     * @param cs
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/updateTime", method = RequestMethod.POST)
    public String updateTime(TimeModel tm, HttpServletResponse response) throws Exception {


        int i = serviceImpl.updateTime(tm);
        if (i != 1) {
            DBrecord.showInfo(response, "警告！！！  修改课程失败", "/page/adminTime.jsp");
            return null;
        } else {
            DBrecord.showInfo(response, "恭喜！！！  修改课程成功", "/page/adminTime.jsp");

        }

        return "adminTime";

    }

    /**
     * 4、查询上课时间段
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("/selectTimeAll")
    @ResponseBody
    public List<TimeModel> selectTimeAll(Integer n, Integer m) throws Exception {

        List<TimeModel> list = serviceImpl.selectTimeAll(n, m);

        return list;

    }

    /**
     * 查询数据库中的总记录数
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("/numberOfBranches")
    public int numberOfBranches() throws Exception {
        int count = serviceImpl.numberOfBranches();
        return count;

    }


}
