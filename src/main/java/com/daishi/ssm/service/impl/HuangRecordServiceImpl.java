package com.daishi.ssm.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daishi.ssm.dao.Class_recordModelMapper;
import com.daishi.ssm.dao.TimeModelMapper;
import com.daishi.ssm.pojo.Class_recordCount;
import com.daishi.ssm.pojo.Class_recordModel;
import com.daishi.ssm.pojo.Class_record_resultMap;
import com.daishi.ssm.pojo.TimeModel;
import com.daishi.ssm.service.HuangIRecordService;

@Service
public class HuangRecordServiceImpl implements HuangIRecordService {
    @Autowired
    private Class_recordModelMapper recordDao;
    @Autowired
    private TimeModelMapper timeDao;

    //查询大致课时
    @Override
    public List<Class_record_resultMap> getSimpleTable(HashMap<String, Integer> m) {
        return recordDao.getSimpleTable(m);
    }

    //上级所需页数
    @Override
    public int getAllrecord_page(HashMap<String, Integer> m) {
        return recordDao.getAllrecord_page(m);
    }

    //查询课时细节
    @Override
    public List<Class_recordModel> getRecordDetail(HashMap<String, Integer> m) {
        return recordDao.getRecordDetail(m);
    }

    //上级所需页数
    @Override
    public int getRecordDetail_page(HashMap<String, Integer> m) {
        return recordDao.getRecordDetail_page(m);
    }

    //执行课时通过
    @Override
    public void updateRecord(Integer id) {
        recordDao.updateRecord(id);
    }

    @Override
    public void updateRecordDetail(Class_recordModel record) {
        recordDao.updateRecordDetail(record);
    }

    @Override
    public void delRecord(int id) {
        recordDao.deleteById(id);
    }

    @Override
    public List<TimeModel> selectAllTime() {
        return timeDao.selectAllTime();
    }

    //复原
    @Override
    public void recall(Integer id) {
        recordDao.recall(id);
    }

    @Override
    public Class_recordCount getCountData(HashMap<String, Integer> m) {
        return recordDao.getCountData(m);
    }

}
