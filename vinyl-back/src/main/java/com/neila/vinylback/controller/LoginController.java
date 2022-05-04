package com.neila.vinylback.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.stp.StpUtil;
import com.neila.vinylback.exception.HasLoginException;
import com.neila.vinylback.utils.Result;
import com.neila.vinylback.entity.User;
import com.neila.vinylback.service.LoginService;
import com.neila.vinylback.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * Created by neila on 2022/3/21 16:14
 **/

@RestController
public class LoginController {
    @Autowired
    LoginService loginService;
    @Autowired
    RegisterService registerService;

    @PostMapping("/login")
    public Result login(@Validated @RequestBody User requestUser) {
        if (StpUtil.isLogin())
            throw new HasLoginException();
        return loginService.login(requestUser);
    }

    @PostMapping("/logout")
    @SaCheckLogin
    public Result logout() {
        StpUtil.logout();
        return Result.succ(200,"注销成功",StpUtil.getTokenInfo());
    }

    @PostMapping("/register")
    public Result register(@Validated @RequestBody User user) {
        return registerService.register(user);
    }

}
