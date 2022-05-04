package com.neila.vinylback.service;

import cn.dev33.satoken.stp.StpUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.neila.vinylback.dto.ReviewFormDTO;
import com.neila.vinylback.dto.ReviewListDTO;
import com.neila.vinylback.entity.Review;
import com.neila.vinylback.exception.MovieNotExistException;
import com.neila.vinylback.mapper.ReviewMapper;
import com.neila.vinylback.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by neila on 2022/4/4 21:59
 **/

@Service
public class ReviewService {

    @Autowired
    ReviewMapper reviewMapper;
    @Autowired
    MovieService movieService;

    // 当前用户是否是影评作者
    public boolean isAuthor(int reviewId) {
        int userId = Integer.parseInt((String) StpUtil.getLoginId());
        if(userId == reviewMapper.getUserIdByReviewId(reviewId))
            return true;
        return false;
    }

    // 当前用户是否已写过该影片的影评
    public boolean hasReview(int movieId) {
        int userId = Integer.parseInt((String) StpUtil.getLoginId());
        Review review = reviewMapper.getReviewByUserIdAndMovieId(userId, movieId);
        return review == null ? false : true;
    }

    public Result updateReview(ReviewFormDTO review) {
        reviewMapper.updateReview(review);

        return Result.succ(200,"更新成功",null);
    }

    public Result addReview(ReviewFormDTO reviewDTO) {
        int userId = Integer.parseInt((String) StpUtil.getLoginId());
        String title = reviewDTO.getTitle();
        String description = reviewDTO.getDescription();
        String body = reviewDTO.getBody();
        int movieId = reviewDTO.getMovieId();
        if(!movieService.isMovieExist(movieId))
            throw new MovieNotExistException();

        Review review = new Review(0,userId,movieId,title,description,body,0,System.currentTimeMillis()
        );
        reviewMapper.addReview(review);
        return Result.succ(200,"添加影评成功",null);
    }

    public Result getReviewById(int id) {
        Review review = reviewMapper.getReviewById(id);
        return Result.succ(review);
    }

    public PageInfo<ReviewListDTO> listPage(int pageNum, int pageSize, Integer movieId, Integer userId) {
        PageHelper.startPage(pageNum,pageSize);
        return new PageInfo<ReviewListDTO>(reviewMapper.listPage(movieId, userId));
    }

    public Result del(int id) {
        reviewMapper.del(id);
        return Result.succ(null);
    }
}
