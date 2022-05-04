package com.neila.vinylback.service;

import cn.dev33.satoken.secure.SaSecureUtil;
import cn.dev33.satoken.stp.StpUtil;
import com.neila.vinylback.dto.UserDTO;
import com.neila.vinylback.exception.PasswordException;
import com.neila.vinylback.exception.UserDisableException;
import com.neila.vinylback.exception.UserNotFoundException;
import com.neila.vinylback.utils.Result;
import com.neila.vinylback.entity.User;
import com.neila.vinylback.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by neila on 2022/3/21 16:53
 **/

@Service
public class LoginService {
    @Autowired
    UserMapper userMapper;

    public Result login(User requestUser) {
        String username = requestUser.getUsername();
        String password = requestUser.getPassword();
        User user = userMapper.findByUsername(username);
        if (user == null) {
            throw new UserNotFoundException();
        }
        String salt = user.getSalt();
        if(SaSecureUtil.md5BySalt(password, salt).equals(user.getPassword())) {
            if(user.getStatus() == 1) {
                throw new UserDisableException();
            }
            StpUtil.login(user.getId());
            // 更新登录时间
            userMapper.updateLastLogin(user.getId(),System.currentTimeMillis());
            UserDTO userDTO = new UserDTO(user.getId(),user.getUsername(),user.getAvatarPath(),user.getStatus());
            return Result.succ(userDTO);
        } else {
            throw new PasswordException();
        }
    }
}
