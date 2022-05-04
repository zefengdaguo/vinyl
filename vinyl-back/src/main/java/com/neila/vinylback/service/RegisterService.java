package com.neila.vinylback.service;

import cn.dev33.satoken.secure.SaSecureUtil;
import com.neila.vinylback.exception.EmailExistException;
import com.neila.vinylback.exception.UsernameExistException;
import com.neila.vinylback.utils.Result;
import com.neila.vinylback.entity.User;
import com.neila.vinylback.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.UUID;

/**
 * Created by neila on 2022/3/23 16:20
 **/

@Service
public class RegisterService {
    @Autowired
    UserMapper userMapper;

    public boolean isExistUsername(String username) {
        User user = userMapper.findByUsername(username);
        return user != null;
    }

    public boolean isExistEmail(String email) {
        return userMapper.isEmailExist(email) != null;
    }

    // 注册
    public Result register(User user) {
        String username = user.getUsername();
        String password = user.getPassword();
        String email = user.getEmail();
        String phone = user.getPhone();
        String profile = user.getProfile();

//        username = HtmlUtils.htmlEscape(username);
        user.setUsername(username);
        user.setEmail(email);
        user.setPhone(phone);
        user.setProfile(profile);

        if(isExistUsername(username)) {
            throw new UsernameExistException();
        }

        if(isExistEmail(email)) {
            throw new EmailExistException();
        }

        // 生成盐
        String salt = UUID.randomUUID().toString().replaceAll("-","");
        // MD5加盐
        String encodedPassword = SaSecureUtil.md5BySalt(password, salt);

        user.setSalt(salt);
        user.setPassword(encodedPassword);
        user.setCreated(System.currentTimeMillis());

        // 以防万一，还需要设置其他属性，防止用户注册时自行修改数据
        // 当然也可以修改插入的 Mapper
        user.setStatus(0);
        user.setAvatarPath("default.png");
        user.setLastLogin(0);
        user.setStatus(0);

        userMapper.save(user);

        return Result.succ(200,"注册成功", null);
    }
}
