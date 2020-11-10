package com.daishi.ssm.dao;

import java.util.HashMap;
import java.util.List;

import com.daishi.ssm.pojo.TClassModel;

public interface TClassModelMapper {
    int deleteByPrimaryKey(Integer id);

    /**
     * 插入班级对象
     *
     * @param record
     * @return
     */
    int insert(TClassModel record) throws Exception;

    /**
     * 在数据库中查询全部班级信息并返回班级对象
     *
     * @return
     * @throws Exception
     */
    List<TClassModel> selectClassAll(HashMap<String, Integer> sMap) throws Exception;

    /**
     * 查询数据库中的班级的总记录数
     *
     * @return
     * @throws Exception
     */
    int selectClassCount() throws Exception;

    /**
     * 根据班级名称删除班级
     *
     * @param tname
     * @throws Exception
     */
    void deleteClass(String tname) throws Exception;

    int insertSelective(TClassModel record);

    TClassModel selectByPrimaryKey(Integer id);

    /**
     * 修改班级名称
     *
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(TClassModel record);

    int updateByPrimaryKey(TClassModel record);

    //全查
    List<TClassModel> selectAll();

}