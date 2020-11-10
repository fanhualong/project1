package com.daishi.ssm.dao;

import java.util.List;

import java.util.HashMap;
import java.util.List;


import com.daishi.ssm.pojo.ClassroomModel;

public interface ClassroomModelMapper {
    int deleteByPrimaryKey(Integer id) throws Exception;

    /**
     * 插入一个教室对象，成功返回1，失败返回0
     * 注意该方法插入时，需要返回自增主键id，记得添加 select LAST_INSERT_ID()
     *
     * @param record
     * @return
     */
    int insert(ClassroomModel record);

    /**
     * 根据教室编号删除教室
     *
     * @param roomname
     * @throws Exception
     */
    void deleteRoom(String roomname) throws Exception;

    /**
     * 查询数据库中的所有教室信息，并返回到页面
     *
     * @return
     * @throws Exception
     */
    List<ClassroomModel> selectRoomAll(HashMap<String, Integer> hashMap) throws Exception;

    int insertSelective(ClassroomModel record);

    ClassroomModel selectByPrimaryKey(Integer id);

    /**
     * 根据教室对象id修改教室名称
     *
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(ClassroomModel record);

    int updateByPrimaryKey(ClassroomModel record);

    //全查
    List<ClassroomModel> selectAll();

}