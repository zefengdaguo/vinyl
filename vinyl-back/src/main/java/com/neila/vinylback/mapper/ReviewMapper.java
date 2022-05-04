package com.neila.vinylback.mapper;

import com.neila.vinylback.dto.ReviewFormDTO;
import com.neila.vinylback.dto.ReviewListDTO;
import com.neila.vinylback.entity.Review;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by neila on 2022/4/4 21:59
 **/

@Mapper
@Repository
public interface ReviewMapper {

    @Select("select user_id from review where id = #{id}")
    int getUserIdByReviewId(int id);

    @Update("update review set title = #{title}, description = #{description}, body = #{body} where id = #{id}")
    int updateReview(ReviewFormDTO review);

    @Select("select * from review where user_id = #{userId} and movie_id = #{movieId}")
    Review getReviewByUserIdAndMovieId(int userId, int movieId);

    @Insert("insert into review(user_id,title,description,body,like_number,date,movie_id) values (#{userId},#{title},#{description},#{body},#{likeNumber},#{date},#{movieId})")
    int addReview(Review review);

    @Select("select * from review where id = #{id}")
    Review getReviewById(int id);

    List<ReviewListDTO> listPage(Integer movieId, Integer userId);

    @Delete("delete from review where id = #{id}")
    int del(int id);

    @Update("update review set like_number = #{likeNumber} where id = #{id}")
    int updateLikeNumber(Long likeNumber, int id);
}
