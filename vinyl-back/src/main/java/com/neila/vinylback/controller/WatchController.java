package com.neila.vinylback.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.stp.StpUtil;
import com.neila.vinylback.entity.UserMovie;
import com.neila.vinylback.service.WatchService;
import com.neila.vinylback.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;


/**
 * Created by neila on 2022/4/10 17:56
 **/

@RequestMapping("/watch")
@RestController
public class WatchController {
    @Autowired
    WatchService watchService;

    @SaCheckLogin
    @PostMapping("/mark/collect")
    public Result markCollect(@Validated @RequestBody UserMovie userMovie) {
        return watchService.mark(userMovie, 1);
    }

    @SaCheckLogin
    @PostMapping("/mark/wish")
    public Result markWish(@Validated @RequestBody UserMovie userMovie) {
        return watchService.mark(userMovie, 0);
    }

    @SaCheckLogin
    @PostMapping("/mark/do")
    public Result markDo(@Validated @RequestBody UserMovie userMovie) {
        return watchService.mark(userMovie, 2);
    }

    @SaCheckLogin
    @DeleteMapping("/mark/delete")
    public Result del(int movieId) {
        return watchService.del(movieId);
    }

    // 返回用户对某片的标记状态；未标记返回-1，否则返回标记信息
    @GetMapping("/marked")
    public Result hasMarked(int movieId) {
        int userId = Integer.parseInt((String) StpUtil.getLoginId());
        UserMovie res = watchService.getByUserIdAndMovieId(userId, movieId);
        if(res == null)
            return Result.succ(200,"未标记",-1);
        return Result.succ(res);
    }

    @GetMapping("/collect/{userId}")
    public Result listCollect(@PathVariable("userId")int userId, int pageNum, int pageSize, String sort) {
        return Result.succ(watchService.list(pageNum, pageSize, sort, 1, userId));
    }

    @GetMapping("/wish/{userId}")
    public Result listWish(@PathVariable("userId")int userId, int pageNum, int pageSize, String sort) {
        return Result.succ(watchService.list(pageNum, pageSize, sort, 0, userId));
    }

    @GetMapping("/do/{userId}")
    public Result listDo(@PathVariable("userId")int userId, int pageNum, int pageSize, String sort) {
        return Result.succ(watchService.list(pageNum, pageSize, sort, 2, userId));
    }
}
