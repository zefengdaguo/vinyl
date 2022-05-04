package com.neila.vinylback.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.neila.vinylback.dto.UserDTO;
import com.neila.vinylback.dto.UserInfoDTO;
import com.neila.vinylback.mapper.UserMapper;
import com.neila.vinylback.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * Created by neila on 2022/3/20 21:01
 **/

@Service
public class UserService {
    @Autowired
    UserMapper userMapper;


    public PageInfo<UserDTO> list(String username, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        return new PageInfo<>(userMapper.list(username));
    }

    public Result status(int userId, int disable) {
        userMapper.status(userId, disable);
        return Result.succ(null);
    }

    public UserInfoDTO getUserInfo(int id) {
        return userMapper.getUserInfoById(id);
    }
}
