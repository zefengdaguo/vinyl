package com.neila.vinylback.service;

import com.neila.vinylback.exception.AdminNotFoundException;
import com.neila.vinylback.exception.PasswordException;
import com.neila.vinylback.utils.Result;
import com.neila.vinylback.entity.Admin;
import com.neila.vinylback.mapper.AdminMapper;
import com.neila.vinylback.utils.StpAdminUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by neila on 2022/3/27 14:26
 **/

@Service
public class AdminService {

    @Autowired
    AdminMapper adminMapper;

    public Result login(Admin requestAdmin) {
        String loginName = requestAdmin.getLoginName();
        String password = requestAdmin.getPassword();
        Admin admin = adminMapper.findByLoginName(loginName);
        if(admin == null) {
            throw new AdminNotFoundException();
        }
        if(password.equals(admin.getPassword())) {
            /*
            管理员本应该是另一个系统，在同一项目中，
            为了不与普通用户冲突，要采用多账号认证
            https://sa-token.dev33.cn/doc/index.html#/up/many-account
            */
            StpAdminUtil.login(admin.getId());
            // 管理员的Token有效期为1小时
            StpAdminUtil.setTokenValue(StpAdminUtil.getTokenValue(), 3600);
            return Result.succ(StpAdminUtil.getTokenInfo());
        } else {
            throw new PasswordException();
        }
    }

}
