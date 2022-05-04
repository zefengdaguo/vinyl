package com.neila.vinylback.mapper;

import com.neila.vinylback.entity.Category;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by neila on 2022/3/29 14:42
 **/

@Mapper
@Repository
public interface CategoryMapper {

    @Select("select * from category where id = #{id}")
    Category getById(int id);

    @Select("select category.* from category JOIN movie_category mc on mc.category_id = category.id and mc.movie_id = #{movieId}")
    List<Category> getByMovieId(int movieId);

    @Select("select * from category order by id")
    List<Category> listAll();
}
