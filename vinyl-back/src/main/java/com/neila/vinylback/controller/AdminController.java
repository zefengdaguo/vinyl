package com.neila.vinylback.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import com.neila.vinylback.entity.Admin;
import com.neila.vinylback.exception.HasLoginException;
import com.neila.vinylback.service.AdminService;
import com.neila.vinylback.utils.Result;
import com.neila.vinylback.utils.StpAdminUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * Created by neila on 2022/3/27 16:10
 **/

@RestController
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    AdminService adminService;

    @PostMapping("/login")
    public Result login(@Validated @RequestBody Admin requestAdmin) {
        return adminService.login(requestAdmin);
    }

    @PostMapping("/logout")
    @SaCheckLogin(type = StpAdminUtil.TYPE)
    public Result logout() {
        StpAdminUtil.logout();
        return Result.succ(200,"注销成功",StpAdminUtil.getTokenInfo());
    }

    // 查询登录状态，用于前端清除登录状态
    @GetMapping("/isLogin")
    public Result isLogin() {
        return Result.succ(StpAdminUtil.isLogin());
    }
}
