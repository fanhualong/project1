package com.daishi.ssm.dao;

import com.daishi.ssm.pojo.ManagerModel;

public interface ManagerModelMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ManagerModel record);

    int insertSelective(ManagerModel record);

    ManagerModel selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ManagerModel record);

    int updateByPrimaryKey(ManagerModel record);

    ManagerModel selectfindByName(ManagerModel ml);
}