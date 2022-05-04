package com.neila.vinylback.mapper;

import com.neila.vinylback.dto.MovieListDTO;
import com.neila.vinylback.entity.UserMovie;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by neila on 2022/4/10 17:57
 **/

@Mapper
@Repository
public interface WatchMapper {

    @Insert("insert into user_movie (user_id,movie_id,rate,status,date,comment,like_number) values (#{userId},#{movieId},#{rate},#{status},#{date},#{comment},#{likeNumber})")
    int insert(UserMovie userMovie);

    @Select("select * from user_movie where user_id = #{userId} and movie_id = #{movieId}")
    UserMovie getByUserIdAndMovieId(int userId, int movieId);

    @Update("update user_movie set rate = #{rate}, status = #{status}, date = #{date}, comment = #{comment} where id = #{id}")
    int update(UserMovie userMovie);

    @Delete("delete from user_movie where user_id = #{userId} and movie_id = #{movieId}")
    int del(int userId, int movieId);

    List<MovieListDTO> getWatchList(int userId, String sort, int status);
}
