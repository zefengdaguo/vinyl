package com.neila.vinylback.mapper;

import com.neila.vinylback.entity.Admin;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

/**
 * Created by neila on 2022/3/27 14:27
 **/

@Mapper
@Repository
public interface AdminMapper {
    @Select("select * from admin where login_name = #{loginName}")
    Admin findByLoginName(String loginName);

}
