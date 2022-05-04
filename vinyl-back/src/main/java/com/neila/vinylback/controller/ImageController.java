package com.neila.vinylback.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.stp.StpUtil;
import com.neila.vinylback.exception.NotLoginException;
import com.neila.vinylback.utils.Result;
import com.neila.vinylback.service.ImageService;
import com.neila.vinylback.utils.StpAdminUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

/**
 * Created by neila on 2022/3/23 14:09
 **/

@RestController
@RequestMapping("/img")
public class ImageController {
    @Autowired
    ImageService imageService;

    // 上传用户头像
    @SaCheckLogin
    @PostMapping("/avatar/upload")
    public Result uploadAvatar(@RequestPart("file") MultipartFile file) {
        return imageService.uploadAvatar(file);
    }

    // 管理员和用户都可以访问，这里无法使用注解鉴权
    // 上传影人图片
    @PostMapping("/profile/upload")
    public Result uploadProfile(@RequestPart("file") MultipartFile file) {
        if(StpUtil.isLogin() || StpAdminUtil.isLogin())
            return imageService.uploadProfile(file);
        throw new NotLoginException();
    }

    // 上传电影海报
    @PostMapping("/poster/upload")
    public Result uploadPoster(@RequestPart("file") MultipartFile file) {
        if(StpUtil.isLogin() || StpAdminUtil.isLogin())
            return imageService.uploadPoster(file);
        throw new NotLoginException();
    }

    // 上传影评内图片
    @SaCheckLogin
    @PostMapping("/articleImg/upload")
    public Result uploadArticleImg(@RequestPart("file") MultipartFile file) {
        return imageService.uploadArticleImg(file);
    }
}
