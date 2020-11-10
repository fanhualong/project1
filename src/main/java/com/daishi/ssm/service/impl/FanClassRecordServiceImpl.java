package com.daishi.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daishi.ssm.dao.Class_recordModelMapper;
import com.daishi.ssm.dao.ClassroomModelMapper;
import com.daishi.ssm.dao.TClassModelMapper;
import com.daishi.ssm.dao.TeacherModelMapper;
import com.daishi.ssm.pojo.Class_recordModel;
import com.daishi.ssm.pojo.ClassroomModel;
import com.daishi.ssm.pojo.TClassModel;
import com.daishi.ssm.pojo.TeacherModel;
import com.daishi.ssm.service.FanlClassRecordService;

@Service
public class FanClassRecordServiceImpl implements FanlClassRecordService {
    @Autowired
    private Class_recordModelMapper classrecord;
    @Autowired
    private TClassModelMapper tClassModel;
    @Autowired
    private ClassroomModelMapper cModel;
    @Autowired
    private TeacherModelMapper teacherModelMapper;

    /**
     * 根据id获取老师的信息返回修改页面
     *
     * @param id
     */
    public Class_recordModel getTeacher(Integer id) {
        Class_recordModel recordModel = classrecord.selectByPrimaryKey(id);
        return recordModel;
    }

    /**
     * 查询class_record所有数据
     */
    @Override
    public List<Class_recordModel> findAllClassRecord() {
        List<Class_recordModel> list = classrecord.selectAll();
        return list;
    }

    /**
     * 根据月份和年份查询class_record所有数据
     */

    @Override
    public List<Class_recordModel> selectBycmonthAndyear(
            Integer year, Integer cmonth) {
        Class_recordModel crmodel = new Class_recordModel();
        crmodel.setCmonth(cmonth);
        crmodel.setYear(year);
        List<Class_recordModel> list = classrecord.selectBycmonthAndyear(crmodel);
        return list;
    }

    /**
     * 添加Class_recordModel课时
     */
    @Override
    public int insertClassRecord(Class_recordModel crecord, TeacherModel teacher) {
        crecord.setTname(teacher.getLoginname());
        crecord.setTeacherid(teacher.getId());
        int i = classrecord.insert(crecord);
        return i;
    }

    /**
     * 全查课程
     */
    @Override
    public List<TClassModel> getClassName() {
        List<TClassModel> list = tClassModel.selectAll();
        return list;
    }

    /**
     * 全查教室
     */
    @Override
    public List<ClassroomModel> getClassRoom() {
        List<ClassroomModel> list = cModel.selectAll();
        return list;
    }

    /**
     * 通过id删除课时
     */
    @Override
    public int delById(Integer id) {
        int i = classrecord.deleteByPrimaryKey(id);
        return i;
    }

    /**
     * 修改课时
     *
     * @param crmodel
     * @param teacher
     */
    public Integer updateClassRecord(Class_recordModel crmodel,
                                     TeacherModel teacher) {
        String name = teacher.getLoginname();
        Integer id = teacher.getId();
        crmodel.setTeacherid(id);
        crmodel.setTname(name);
        int i = classrecord.updateByPrimaryKeySelective(crmodel);
        return i;
    }


}
