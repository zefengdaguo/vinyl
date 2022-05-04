package com.neila.vinylback.mapper;

import com.neila.vinylback.dto.*;
import com.neila.vinylback.entity.Movie;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by neila on 2022/3/27 17:02
 **/

@Mapper
@Repository
public interface MovieMapper {

    // 分别指定属性keyProperty和keyColumn为对应的数据库记录主键字段与Java对象的主键属性
    // 插入后 Movie 对象的id会成为新增的主键id
    @Options(useGeneratedKeys = true, keyProperty = "id", keyColumn = "id")
    @Insert("insert into movie(title, original_title, year, release_date, poster_path, runtime, is_tv, episode_number, overview, is_able, creator, last_update) values (#{title},#{originalTitle},#{year},#{releaseDate},#{posterPath},#{runtime},#{isTv},#{episodeNumber},#{overview},#{isAble},#{creator},#{lastUpdate})")
    int save(Movie movie);

    List<AdminMovieDTO> adminList(Integer isAble);

    @Update("update movie set is_able = #{isAble} where id = #{id}")
    int audit(int id, int isAble);

    @Insert("insert into movie_category(movie_id, category_id) values (#{movieId}, #{categoryId})")
    int setCategory(int movieId, int categoryId);

    @Insert("insert into movie_language(movie_id, language_id) values (#{movieId}, #{languageId})")
    int setLanguage(int movieId, int languageId);

    @Insert("insert into movie_country(movie_id, country_id) values (#{movieId}, #{countryId})")
    int setCountry(int movieId, int countryId);

    @Select("select id,title,original_title,year,release_date,poster_path,runtime,is_tv,episode_number,rate,overview,id countries,id languages,id categories from movie where id = #{id} and is_able = 1")
    @Results({
            @Result(property = "countries", column = "countries",
                    many = @Many(select = "com.neila.vinylback.mapper.CountryMapper.getByMovieId")),
            @Result(property = "languages", column = "languages",
                    many = @Many(select = "com.neila.vinylback.mapper.LanguageMapper.getByMovieId")),
            @Result(property = "categories", column = "categories",
                    many = @Many(select = "com.neila.vinylback.mapper.CategoryMapper.getByMovieId"))
    })
    MovieInfoDTO getMovieInfoDTOById(int id);

    @Select("select title from movie where id = #{id} and is_able = 1")
    String getMovieTitleById(int id);

    @Select("select poster_path from movie where id = #{id} and is_able = 1")
    String getMoviePosterById(int id);

    @Select("select is_tv from movie where id = #{movieId} and is_able = 1")
    Integer isTv(int movieId);

    List<MovieBlockDTO> list(String sort, int[] categories, Integer personId);

    @Select("SELECT  mp.person_id, p.name person_name,p.profile_path, mp.role_name role\n" +
            "FROM `movie_person` mp\n" +
            "inner join person p\n" +
            "on p.id = mp.person_id\n" +
            "inner join movie m\n" +
            "on m.id = #{id} and m.id = mp.movie_id\n" +
            "order BY mp.role_id")
    List<MoviePersonDTO> getPeople(int id);

    int addRoles(int movieId, MoviePersonRoleDTO[] moviePersonRoleDTOS);

    List<CommentDTO> getComment(int id, String sort);

    @Select("select distinct id, title, rate, poster_path from movie where is_able = 1 and (title like #{title} or original_title like #{title})")
    List<MovieBlockDTO> search(String title);

    // 用3个id别名传给对应的查询作为参数
    @Select("select *,id countries,id languages,id categories from movie where id = #{id}")
    @Results({
            @Result(property = "countries", column = "countries",
                    many = @Many(select = "com.neila.vinylback.mapper.CountryMapper.getByMovieId")),
            @Result(property = "languages", column = "languages",
                    many = @Many(select = "com.neila.vinylback.mapper.LanguageMapper.getByMovieId")),
            @Result(property = "categories", column = "categories",
                    many = @Many(select = "com.neila.vinylback.mapper.CategoryMapper.getByMovieId"))
    })
    Movie adminId(int id);

}
