package com.daishi.ssm.dao;

import java.util.HashMap;
import java.util.List;

import com.daishi.ssm.pojo.TimeModel;

public interface TimeModelMapper {
    int deleteByPrimaryKey(Integer id);

    /**
     * 向数据库中添加上课时间
     *
     * @param record
     * @return
     */
    int insert(TimeModel record) throws Exception;

    /**
     * 根据上课时间段删除该列字段
     *
     * @param createtime
     * @throws Exception
     */
    void deleteTime(String createtime) throws Exception;

    //查询所有时间*黄
    List<TimeModel> selectAllTime();

    /**
     * 查询数据库中时间表的所有字段
     *
     * @return
     * @throws Exception
     */
    List<TimeModel> selectTimeAll(HashMap<String, Integer> sMap) throws Exception;

    int insertSelective(TimeModel record);

    TimeModel selectByPrimaryKey(Integer id);

    /**
     * 修改时间
     *
     * @param cs
     * @return
     * @throws Exception
     */
    int updateByPrimaryKeySelective(TimeModel record);

    int updateByPrimaryKey(TimeModel record);

}