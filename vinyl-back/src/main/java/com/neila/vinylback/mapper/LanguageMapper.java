package com.neila.vinylback.mapper;

import com.neila.vinylback.entity.Language;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by neila on 2022/3/29 14:42
 **/

@Mapper
@Repository
public interface LanguageMapper {
    @Select("select * from language where id = #{id}")
    Language getById(int id);

    @Select("select language.* from language JOIN movie_language ml on ml.language_id = language.id and ml.movie_id = #{movieId}")
    List<Language> getByMovieId(int movieId);

    @Select("select * from language")
    List<Language> listAll();
}
