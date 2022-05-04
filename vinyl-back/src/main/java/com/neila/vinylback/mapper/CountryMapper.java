package com.neila.vinylback.mapper;

import com.neila.vinylback.entity.Country;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by neila on 2022/3/28 20:00
 **/

@Mapper
@Repository
public interface CountryMapper {

    @Select("select * from country where id = #{id}")
    Country getById(int id);

    @Select("select country.* from country JOIN movie_country mc on mc.country_id = country.id and mc.movie_id = #{movieId}")
    List<Country> getByMovieId(int movieId);

    @Select("select * from country")
    List<Country> listAll();
}
