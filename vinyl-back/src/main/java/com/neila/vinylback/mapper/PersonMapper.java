package com.neila.vinylback.mapper;

import com.neila.vinylback.dto.PersonBlockDTO;
import com.neila.vinylback.entity.Person;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by neila on 2022/3/28 16:15
 **/

@Mapper
@Repository
public interface PersonMapper {

    @Insert("insert into person(name,original_name,profile_path,gender,introduction,country_id,birthday,enabled,submitter,last_update) values (#{name},#{originalName},#{profilePath},#{gender},#{introduction},#{country.id},#{birthday},#{enabled},#{submitter},#{lastUpdate})")
    int save(Person person);

    List<Person> adminList(Integer enabled);

    @Update("update person set enabled = #{enabled} where id = #{id}")
    int audit(int id, int enabled);

    @Select("select * from person where id = #{id} and enabled = 1")
    @Results({
            @Result(property = "country", column = "country_id",
                    one = @One(select = "com.neila.vinylback.mapper.CountryMapper.getById"))
    })
    Person getPersonById(int id);

    @Select("select distinct id, name, profile_path from person where enabled = 1 and (name like #{name} or original_name like #{name})")
    List<PersonBlockDTO> search(String name);

    @Select("select * from person where id = #{id}")
    @Results({
            @Result(property = "country", column = "country_id",
                    one = @One(select = "com.neila.vinylback.mapper.CountryMapper.getById"))
    })
    Person adminId(int id);
}
