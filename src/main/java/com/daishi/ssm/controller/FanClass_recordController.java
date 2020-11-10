package com.daishi.ssm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.daishi.ssm.pojo.Class_recordModel;
import com.daishi.ssm.pojo.ClassroomModel;
import com.daishi.ssm.pojo.TClassModel;
import com.daishi.ssm.pojo.TeacherModel;
import com.daishi.ssm.service.impl.FanClassRecordServiceImpl;
import com.daishi.ssm.service.impl.FanTeacherServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("class_record")
public class FanClass_recordController {
    @Autowired
    private FanClassRecordServiceImpl classRecordService;

    /**
     * 查询class_record中所有数据，返回给ajax
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/getTeacher", method = RequestMethod.POST)
    @ResponseBody
    public Class_recordModel getTeacher(Integer id, Model m) {
        Class_recordModel recordModel = classRecordService.getTeacher(id);
		/*ModelAndView model=new ModelAndView();
		model.addObject("recordModel", recordModel);
		model.addObject("name", "666");*/
        //model.setViewName("recordList.jsp");
        m.addAttribute("tx", "asdf");
        m.addAttribute("teacher", recordModel);
        System.out.println("jin;" + recordModel.getClassname());
        return recordModel;
    }

    @RequestMapping("/findAll")
    @ResponseBody
    public List findAllClassRecord() {

        List<Class_recordModel> list = classRecordService.findAllClassRecord();
        System.out.println(list.get(0));
        System.out.println(list.get(0).getId());
        return list;
    }
    /**
     * 分页查询--查询class_record
     * 全查
     * @return
     * version=1.0
     */
	/*@RequestMapping("selectpage1")
	@ResponseBody
	public List<Class_recordModel> findAllClass_recordModel(int page,int pageSize){
		
		return null;
	}*/

    /**
     * 分页查询--查询class_record
     * 根据年月查询
     *
     * @return version=2.0
     */
    @RequestMapping("selectpage")
    @ResponseBody
    public List<Class_recordModel> selectPageClassRecord(@RequestParam(defaultValue = "1") int page, int pageSize, Integer year, Integer cmonth) {
        System.out.println("页数=" + page + ",  个数=" + pageSize + ",  年=" + year + ",  月=" + cmonth);
        PageHelper.startPage(page, pageSize);
        List<Class_recordModel> list = classRecordService.selectBycmonthAndyear(year, cmonth);
        PageInfo<Class_recordModel> p = new PageInfo<Class_recordModel>(list);
        System.out.println("list:" + list);
        //System.out.println(p);
        return list;
    }

    /**
     * 添加ClassRecord课时
     *
     * @return
     */
    @RequestMapping(value = "/insertrecord", method = RequestMethod.POST)
    @ResponseBody
    public Integer insertClassRecord(Class_recordModel crmodel, HttpSession session) {
        //先从session中取值
        TeacherModel teacher = (TeacherModel) session.getAttribute("t");
        int i = classRecordService.insertClassRecord(crmodel, teacher);
        System.out.println(i);
        return i;
    }

    /**
     * 取出班级名称
     *
     * @return
     */
    @RequestMapping("/getClassName")
    @ResponseBody
    public List<TClassModel> getClassName() {
        List<TClassModel> list = classRecordService.getClassName();
        return list;
    }

    /**
     * 取出教室名称
     *
     * @return
     */
    @RequestMapping("/getClassRoom")
    @ResponseBody
    public List<ClassroomModel> getClassRoom() {
        List<ClassroomModel> list = classRecordService.getClassRoom();
        return list;
    }

    @RequestMapping("/delById")
    @ResponseBody
    public int delById(Integer id) {
        System.out.println(id);
        int i = classRecordService.delById(id);
        return i;
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public Integer updateClassRecord(Class_recordModel crmodel, HttpSession session) {
        System.out.println("进入MVC=" + crmodel);
        TeacherModel teacher = (TeacherModel) session.getAttribute("t");
        Integer i = classRecordService.updateClassRecord(crmodel, teacher);
        System.out.println("修改成功,i=" + i);
        return i;
    }
}
