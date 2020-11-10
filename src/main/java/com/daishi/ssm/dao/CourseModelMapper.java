package com.daishi.ssm.dao;

import java.util.HashMap;
import java.util.List;

import com.daishi.ssm.pojo.CourseModel;

public interface CourseModelMapper {
    /**
     * 删除课程
     *
     * @param id
     * @return
     */
    void deleteByPrimaryKey(String tname);

    //添加课程
    int insert(CourseModel record);

    int insertSelective(CourseModel record);

    CourseModel selectByPrimaryKey(Integer id);


    /**
     * 修改课程名称
     *
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(CourseModel record) throws Exception;

    int updateByPrimaryKey(CourseModel record);

    /*  
    	查询全部课程
  		<!-- nowpage当前页  countPage 总页   counRecord 总记录数-->
 		通过上面的分析，可以得出符合我们自己需求的分页sql格式是：select * from table limit (start-1)*limit,limit; 其中start是页码，limit是每页显示的条数。
 	*/
    List<CourseModel> selectCourseAll(HashMap<String, Integer> hashMap);


}