package com.daishi.ssm.service;

import java.util.List;

import com.daishi.ssm.pojo.Class_recordModel;
import com.daishi.ssm.pojo.ClassroomModel;
import com.daishi.ssm.pojo.TClassModel;
import com.daishi.ssm.pojo.TeacherModel;

public interface FanlClassRecordService {
    public List<Class_recordModel> findAllClassRecord();

    public List<Class_recordModel> selectBycmonthAndyear(Integer year, Integer cmonth);

    //添加课时
    public int insertClassRecord(Class_recordModel classrecord, TeacherModel teacher);

    //查询所有课程
    public List<TClassModel> getClassName();

    //查询所有班级
    public List<ClassroomModel> getClassRoom();

    //删除课时
    public int delById(Integer id);

    //修改课时
    public Integer updateClassRecord(Class_recordModel crmodel, TeacherModel teacher);

    public Class_recordModel getTeacher(Integer id);
}
