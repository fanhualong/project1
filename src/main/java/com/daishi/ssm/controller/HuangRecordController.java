package com.daishi.ssm.controller;

import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSON;
import com.daishi.ssm.pojo.Class_recordCount;
import com.daishi.ssm.pojo.Class_recordModel;
import com.daishi.ssm.pojo.Class_record_resultMap;
import com.daishi.ssm.pojo.ClassroomModel;
import com.daishi.ssm.pojo.TClassModel;
import com.daishi.ssm.pojo.TimeModel;
import com.daishi.ssm.service.FanlClassRecordService;
import com.daishi.ssm.service.HuangIRecordService;
import com.daishi.ssm.utils.TimeUtils;

@Controller
@RequestMapping("/keshi")
public class HuangRecordController {

    @Autowired
    private HuangIRecordService recordService;
    @Autowired
    private FanlClassRecordService fService;

    // 得到大致课时数据
    @RequestMapping("/getSimpleTable.do")
    public void getSimpleTable(Integer year, Integer month, Integer page,
                               HttpServletResponse reps) {
        HashMap<String, Integer> m = new HashMap<>();
        m.put("year", year);
        m.put("month", month);
        m.put("page", (page - 1) * 7);
        List<Class_record_resultMap> recordList = recordService
                .getSimpleTable(m);
        int pages = recordService.getAllrecord_page(m);
        List<Object> array = new ArrayList<>();
        array.add(recordList);
        array.add((pages + 6) / 7);
        String json = JSON.toJSONString(array);
        try {
            reps.getWriter().print(json);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    // 得到课时数据细节
    @RequestMapping("/getRecordDetail.do")
    public void getRecordDetail(Integer tId, Integer year, Integer month,
                                Integer page, Integer rType, Integer pageCount,
                                HttpServletResponse reps) {
        HashMap<String, Integer> m = new HashMap<>();
        m.put("tid", tId);
        m.put("year", year);
        m.put("month", month);
        m.put("pageCount", pageCount);
        m.put("rType", rType);
        m.put("page", (page - 1) * pageCount);
        List<Class_recordModel> recordDetailList = recordService
                .getRecordDetail(m);
        int pages = recordService.getRecordDetail_page(m);
        Class_recordCount countData = recordService.getCountData(m);
        List<Object> array = new ArrayList<>();
        array.add(recordDetailList);
        array.add((pages + (pageCount - 1)) / pageCount);
        array.add(countData);
        String json = JSON.toJSONString(array);
        try {
            reps.getWriter().print(json);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    // 提交通过
    @RequestMapping("/updateRecord.do")
    public void updateRecord(String ids) {
        String[] idArray = ids.split(",");
        for (int i = 0; i < idArray.length; i++) {
            int id = Integer.parseInt(idArray[i]);
            recordService.updateRecord(id);
        }
    }

    // 修改预设
    @RequestMapping("/updateNeed.do")
    public void updateNeed(HttpServletResponse reps) {
        List<TClassModel> allClass = fService.getClassName();
        List<ClassroomModel> allRoom = fService.getClassRoom();
        List<TimeModel> allTime = recordService.selectAllTime();
        List<Object> dataList = new ArrayList<Object>();
        dataList.add(allClass);
        dataList.add(allRoom);
        dataList.add(allTime);
        String json = JSON.toJSONString(dataList);
        try {
            reps.getWriter().print(json);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    // 修改课时
    @RequestMapping(value = "/updateRecordDetail.do", method = RequestMethod.POST)
    public String updateRecord(HttpServletRequest req, RedirectAttributes attr) {
        String id = req.getParameter("id_hide");
        String tid = req.getParameter("tid_hide");
        String tname = req.getParameter("name_hide");
        String rtime = req.getParameter("select-date");
        String allday = req.getParameter("allday");
        String classname = req.getParameter("select-class");
        String roomname = req.getParameter("classroom");
        String count = req.getParameter("count");
        String onduty = req.getParameter("zhiban");
        String begintime = req.getParameter("start-time");
        String endtime = req.getParameter("end-time");
        String remark = req.getParameter("beizhu");
        String week = TimeUtils.getWeek(rtime);
        Class_recordModel cm = new Class_recordModel();

        if (null != rtime) {
            cm.setRtime(rtime);
            cm.setTimeweek(week);
        }
        if (Integer.parseInt(allday) == 1) {
            cm.setBegintime("08:40");
            cm.setEndtime("17:30");
        } else {
            if (null != begintime)
                cm.setBegintime(begintime);
            if (null != endtime)
                cm.setEndtime(endtime);
        }
        if (null != classname)
            cm.setClassname(classname);
        if (null != roomname)
            cm.setRoomname(roomname);
        if (null != count)
            cm.setSectionnumber(Integer.parseInt(count));
        if (null != onduty)
            cm.setOnduty(Integer.parseInt(onduty));
        if (null != remark)
            cm.setRemark(remark);
        cm.setId(Integer.parseInt(id));
        recordService.updateRecordDetail(cm);
        attr.addAttribute("tId", tid);
        attr.addAttribute("tname", tname);
        System.out.println(req.getParameter("m"));
        System.out.println(req.getParameter("y"));
        attr.addAttribute("m", req.getParameter("m"));
        attr.addAttribute("y", req.getParameter("y"));
        return "redirect:/page/adminRecordList.jsp";
    }

    // 删除
    @RequestMapping(value = "/delRecord.do", method = RequestMethod.POST)
    public String delRecord(HttpServletRequest req, RedirectAttributes attr) {
        String id = req.getParameter("id_hide");
        String tname = req.getParameter("name_hide");
        String tid = req.getParameter("tid_hide");
        recordService.delRecord(Integer.parseInt(id));
        attr.addAttribute("tId", tid);
        attr.addAttribute("tname", tname);
        attr.addAttribute("m", req.getParameter("m"));
        attr.addAttribute("y", req.getParameter("y"));
        return "redirect:/page/adminRecordList.jsp";
    }

    // 复原
    @RequestMapping("/recall.do")
    public void recall(Integer id, HttpServletResponse resp) {
        recordService.recall(id);
    }
}
