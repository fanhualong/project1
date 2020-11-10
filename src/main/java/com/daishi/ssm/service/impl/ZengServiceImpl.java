package com.daishi.ssm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CountDownLatch;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daishi.ssm.dao.ClassroomModelMapper;
import com.daishi.ssm.dao.CourseModelMapper;
import com.daishi.ssm.dao.TClassModelMapper;
import com.daishi.ssm.dao.TimeModelMapper;
import com.daishi.ssm.pojo.ClassroomModel;
import com.daishi.ssm.pojo.CourseModel;
import com.daishi.ssm.pojo.TClassModel;
import com.daishi.ssm.pojo.TimeModel;
import com.daishi.ssm.service.IZengService;

@Service
public class ZengServiceImpl implements IZengService {
    @Autowired
    private CourseModelMapper csModel;
    @Autowired
    private TClassModelMapper tClassDao;
    @Autowired
    private ClassroomModelMapper roomDao;
    @Autowired
    private TimeModelMapper timeModelDao;

    /**
     * /1、 添加课程
     */
    @Override
    public int addCouese(CourseModel cs) {

        return csModel.insert(cs);
    }

    /**
     * 1、根据课程名称删除课程
     *
     * @param tname
     * @throws Exception
     */
    @Override
    public void deleteCouese(String tname) throws Exception {
        // TODO Auto-generated method stub
        csModel.deleteByPrimaryKey(tname);
    }

    /**
     * 1、修改课程名称
     *
     * @return
     * @throws Exception
     */
    @Override
    public int updateCouese(CourseModel cm) throws Exception {
        return csModel.updateByPrimaryKeySelective(cm);
    }

    /**
     * 1、 查询全部课程
     */
    @Override
    public List<CourseModel> selectCourseAll(Integer n, Integer m)
            throws Exception {
        HashMap<String, Integer> hashMap = new HashMap<String, Integer>();
        hashMap.put("n", (n - 1) * m);
        hashMap.put("m", m);

        return csModel.selectCourseAll(hashMap);
    }

    /**
     * 2、 添加新班级
     */
    @Override
    public int AddClassModel(TClassModel tClass) throws Exception {

        return tClassDao.insert(tClass);
    }

    /**
     * 2、删除班级
     */
    @Override
    public void deleteClass(String tname) throws Exception {
        tClassDao.deleteClass(tname);

    }

    /**
     * 2、修改班级名称
     *
     * @param tc
     * @return
     * @throws Exception
     */
    @Override
    public int updateClass(TClassModel tc) throws Exception {
        return tClassDao.updateByPrimaryKeySelective(tc);
    }

    /**
     * 2、查询全部班级
     *
     * @return
     * @throws Exception
     */
    @Override
    public List<TClassModel> selectClassAll(Integer n, Integer m)
            throws Exception {
        HashMap<String, Integer> sMap = new HashMap<String, Integer>();
        int currIndex = (n - 1) * m;
        sMap.put("currIndex", currIndex);
        sMap.put("m", m);

        return tClassDao.selectClassAll(sMap);
    }

    /**
     * 3、添加教室
     *
     * @param cm
     * @return
     * @throws Exception
     */
    @Override
    public int AddAdminRoom(ClassroomModel cm) throws Exception {

        return roomDao.insert(cm);
    }

    /**
     * 3、删除教室
     *
     * @param roomname
     * @throws Exception
     */
    @Override
    public void deleteRoom(String roomname) throws Exception {
        // TODO Auto-generated method stub
        roomDao.deleteRoom(roomname);

    }

    /**
     * 3、修改教室名称
     *
     * @param cs
     * @return
     * @throws Exception
     */
    @Override
    public int updateRoom(ClassroomModel cm) throws Exception {
        // TODO Auto-generated method stub
        return roomDao.updateByPrimaryKeySelective(cm);
    }

    /**
     * 3、查询所有教室信息，并在页面上展示
     *
     * @return
     * @throws Exception
     */
    @Override
    public List<ClassroomModel> selectRoomAll(Integer n, Integer m)
            throws Exception {
        HashMap<String, Integer> hashMap = new HashMap<String, Integer>();
        hashMap.put("currIndex", (n - 1) * m);
        hashMap.put("m", m);

        return roomDao.selectRoomAll(hashMap);
    }

    /**
     * 添加上课时间
     */
    @Override
    public int addTimeModel(TimeModel tm) throws Exception {

        return timeModelDao.insert(tm);
    }

    /**
     * 4、删除上课时间段
     *
     * @param createtime
     * @throws Exception
     */
    @Override
    public void deleteTime(String createtime) throws Exception {
        // TODO Auto-generated method stub
        timeModelDao.deleteTime(createtime);

    }

    /**
     * 4、修改时间
     *
     * @param cs
     * @return
     * @throws Exception
     */
    @Override
    public int updateTime(TimeModel tm) throws Exception {

        return timeModelDao.updateByPrimaryKeySelective(tm);
    }


    /**
     * 4、查询出数据库中所有的上课时间段
     */
    @Override
    public List<TimeModel> selectTimeAll(Integer n, Integer m) throws Exception {
        HashMap<String, Integer> sMap = new HashMap<String, Integer>();
        int currIndex = (n - 1) * m;
        sMap.put("currIndex", currIndex);
        sMap.put("m", m);
        return timeModelDao.selectTimeAll(sMap);
    }

    /**
     * 返回数据库中班级的总记录数
     */
    @Override
    public int numberOfBranches() throws Exception {
        // TODO Auto-generated method stub
        int i = tClassDao.selectClassCount();
        int count = 0;
        if (i % 10 != 0) {
            count = (i / 10) + 1;

        } else {
            count = i % 10;
        }

        return count;
    }


}
