package com.daishi.ssm.service;


import java.util.List;

import com.daishi.ssm.pojo.ClassroomModel;
import com.daishi.ssm.pojo.CourseModel;
import com.daishi.ssm.pojo.TClassModel;
import com.daishi.ssm.pojo.TimeModel;

public interface IZengService {
    /**
     * 1、添加课程
     *
     * @throws Exception
     */
    public int addCouese(CourseModel cs) throws Exception;

    /**
     * 1、根据课程名称删除课程
     *
     * @param tname
     * @throws Exception
     */
    public void deleteCouese(String tname) throws Exception;

    /**
     * 1、修改课程名称
     *
     * @return
     * @throws Exception
     */
    public int updateCouese(CourseModel cm) throws Exception;

    /**
     * 1、查询全部课程
     *
     * @throws Exception
     */
    public List<CourseModel> selectCourseAll(Integer n, Integer m) throws Exception;

    /**
     * 2、添加班级
     *
     * @return
     * @throws Exception
     */
    public int AddClassModel(TClassModel tClass) throws Exception;

    /**
     * 2、删除班级
     *
     * @param tname
     */
    public void deleteClass(String tname) throws Exception;

    /**
     * 2、修改班级名称
     *
     * @param tc
     * @return
     * @throws Exception
     */
    public int updateClass(TClassModel tc) throws Exception;

    /**
     * 2、查询全部班级
     *
     * @return
     * @throws Exception
     */
    public List<TClassModel> selectClassAll(Integer n, Integer m) throws Exception;

    /**
     * 3、添加教室
     *
     * @param cm
     * @return
     * @throws Exception
     */
    public int AddAdminRoom(ClassroomModel cm) throws Exception;

    /**
     * 3、删除教室
     *
     * @param roomname
     * @throws Exception
     */
    public void deleteRoom(String roomname) throws Exception;

    /**
     * 3、修改教室名称
     *
     * @param cs
     * @return
     * @throws Exception
     */
    public int updateRoom(ClassroomModel cm) throws Exception;

    /**
     * 3、查询所有教室信息，并在页面上展示
     *
     * @return
     * @throws Exception
     */
    public List<ClassroomModel> selectRoomAll(Integer n, Integer m) throws Exception;

    /**
     * 4、添加上课时间
     *
     * @param tm
     * @return
     * @throws Exception
     */
    public int addTimeModel(TimeModel tm) throws Exception;

    /**
     * 4、删除上课时间段
     *
     * @param createtime
     * @throws Exception
     */
    public void deleteTime(String createtime) throws Exception;

    /**
     * 4、查询出所有的上课时间段
     *
     * @throws Exception
     */
    public List<TimeModel> selectTimeAll(Integer n, Integer m) throws Exception;

    /**
     * 4、修改时间
     *
     * @param cs
     * @return
     * @throws Exception
     */
    public int updateTime(TimeModel tm) throws Exception;

    /**
     * 4、 查询数据库中的总记录数
     *
     * @return
     */
    public int numberOfBranches() throws Exception;


} 


