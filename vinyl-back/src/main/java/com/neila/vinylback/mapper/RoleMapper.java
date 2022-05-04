package com.neila.vinylback.mapper;

import com.neila.vinylback.entity.Role;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by neila on 2022/4/12 22:20
 **/

@Mapper
@Repository
public interface RoleMapper {

    @Select("select * from role order by id")
    List<Role> listAll();
}
