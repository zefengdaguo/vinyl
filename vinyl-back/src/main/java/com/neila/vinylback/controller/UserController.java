package com.neila.vinylback.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.stp.StpUtil;
import com.neila.vinylback.service.UserService;
import com.neila.vinylback.utils.Result;
import com.neila.vinylback.utils.StpAdminUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * Created by neila on 2022/3/19 18:17
 **/

@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserService userService;

    @GetMapping("/{id}")
    public Result getUserInfo(@PathVariable("id") int id) {
        return Result.succ(userService.getUserInfo(id));
    }

    // 查询登录状态，用于前端清除登录状态
    @GetMapping("/isLogin")
    public Result isLogin() {
        return Result.succ(StpUtil.isLogin());
    }

    /**
     * @param username 可选参数，会搜索用户名返回列表
     * 注意：username 必须放在第一个参数位置！！！否则配合分页会出错！！！
     * @return
     */
    @GetMapping("/list")
    @SaCheckLogin(type = StpAdminUtil.TYPE)
    public Result list(String username, int pageNum, int pageSize) {
        if(username != null)
            username = "%" + username + "%";
        return Result.succ(userService.list(username, pageNum, pageSize));
    }

    /**
     * @param userId
     * @param disable 0 正常，1 封禁
     * @return
     */
    @PutMapping("/status")
    @SaCheckLogin(type = StpAdminUtil.TYPE)
    public Result status(int userId, int disable) {
        // 封禁时要将该用户下线
        if(disable == 1)
            StpUtil.logout(userId);
        return userService.status(userId, disable);
    }

}
