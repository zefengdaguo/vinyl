package com.neila.vinylback.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.stp.StpUtil;
import com.neila.vinylback.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by neila on 2022/5/1 16:35
 **/

@RestController
public class LikeController {
    @Autowired
    RedisTemplate redisTemplate;

    @SaCheckLogin
    @PostMapping("/dolike")
    public Result doLike(int reviewId) {
        int userId = Integer.parseInt((String) StpUtil.getLoginId());
        return Result.succ(redisTemplate.opsForSet().add("review:"+reviewId,userId));
    }

    @SaCheckLogin
    @PostMapping("/undolike")
    public Result undoLike(int reviewId) {
        int userId = Integer.parseInt((String) StpUtil.getLoginId());
        return Result.succ(redisTemplate.opsForSet().remove("review:"+reviewId,userId));
    }

    @GetMapping("/likeNumber")
    public Result getLikeNumber(int reviewId) {
        return Result.succ(redisTemplate.opsForSet().size("review:"+reviewId));
    }

    @GetMapping("/hasLike")
    public Result hasLike(int reviewId) {
        int userId = Integer.parseInt((String) StpUtil.getLoginId());
        return Result.succ(redisTemplate.opsForSet().isMember("review:"+reviewId,userId));
    }
}
