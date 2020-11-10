package com.daishi.ssm.dao;

import java.util.HashMap;
import java.util.List;

import com.daishi.ssm.pojo.Class_recordCount;
import com.daishi.ssm.pojo.Class_recordModel;
import com.daishi.ssm.pojo.Class_record_resultMap;

public interface Class_recordModelMapper {

    int insert(Class_recordModel record);

    int insertSelective(Class_recordModel record);

    Class_recordModel selectByPrimaryKey(Integer id);

    //全查Class_recordModel
    List<Class_recordModel> selectAll();

    //根据月份和年份查询 Class_recordModel
    List<Class_recordModel> selectBycmonthAndyear(Class_recordModel crmodel);


    int updateByPrimaryKeySelective(Class_recordModel record);

    int updateByPrimaryKey(Class_recordModel record);

    //查询大致课时
    List<Class_record_resultMap> getSimpleTable(HashMap<String, Integer> m);

    //上级所需页数
    int getAllrecord_page(HashMap<String, Integer> m);

    //查询课时细节
    List<Class_recordModel> getRecordDetail(HashMap<String, Integer> m);

    //上级所需页数
    int getRecordDetail_page(HashMap<String, Integer> m);

    //执行课时通过
    void updateRecord(Integer id);

    //修改
    void updateRecordDetail(Class_recordModel record);

    //删除(黄)
    int deleteById(Integer id);

    //删除（樊）
    int deleteByPrimaryKey(Integer id);

    //复原
    void recall(Integer id);

    //几月多少条
    Class_recordCount getCountData(HashMap<String, Integer> m);

}