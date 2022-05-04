package com.neila.vinylback.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.stp.StpUtil;
import com.neila.vinylback.dto.ReviewFormDTO;
import com.neila.vinylback.exception.HasReviewException;
import com.neila.vinylback.exception.NotLoginException;
import com.neila.vinylback.exception.NotReviewAuthorException;
import com.neila.vinylback.service.ReviewService;
import com.neila.vinylback.utils.Result;
import com.neila.vinylback.utils.StpAdminUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * Created by neila on 2022/4/4 21:58
 **/

@RequestMapping("/review")
@RestController
public class ReviewController {

    @Autowired
    ReviewService reviewService;

    @GetMapping("/{id}")
    public Result getReviewById(@PathVariable("id") int id) {
        return reviewService.getReviewById(id);
    }

    @GetMapping("/list")
    public Result list(int pageNum, int pageSize, Integer movieId, Integer userId) {
        return Result.succ(reviewService.listPage(pageNum,pageSize,movieId,userId));
    }

    // 新增或编辑一篇影评
    @SaCheckLogin
    @PostMapping("/edit")
    public Result edit(@Validated @RequestBody ReviewFormDTO review) {
        // 编辑
        if(review.getId() != 0) {
            // 是否为该影评作者
            if(reviewService.isAuthor(review.getId())) {
                return reviewService.updateReview(review);
            } else {
                throw new NotReviewAuthorException();
            }
        } else {
            // 新增
            if(reviewService.hasReview(review.getMovieId()))
                throw new HasReviewException();
            return reviewService.addReview(review);
        }
    }

    @DeleteMapping("/del/{id}")
    public Result del(@PathVariable("id") int id) {
        if(StpUtil.isLogin() || StpAdminUtil.isLogin())
            return reviewService.del(id);
        throw new NotLoginException();
    }

}
