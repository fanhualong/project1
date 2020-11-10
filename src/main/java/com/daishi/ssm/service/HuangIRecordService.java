package com.daishi.ssm.service;

import java.util.HashMap;
import java.util.List;

import com.daishi.ssm.pojo.Class_recordCount;
import com.daishi.ssm.pojo.Class_recordModel;
import com.daishi.ssm.pojo.Class_record_resultMap;
import com.daishi.ssm.pojo.TimeModel;

public interface HuangIRecordService {
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

    //删除
    void delRecord(int id);

    //查询所有时间
    List<TimeModel> selectAllTime();

    //复原
    void recall(Integer id);

    Class_recordCount getCountData(HashMap<String, Integer> m);
}
