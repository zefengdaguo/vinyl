package com.neila.vinylback.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;

/**
 * Created by neila on 2022/3/27 14:14
 **/

// 管理员密码，不再MD5加盐，管理员账户在数据库中直接创建。
// 管理系统可作为另一个项目，部署在公司内网，课设为了方便，在同一系统中
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Admin {

    private int id;

    @NotBlank(message = "登录名不能为空")
    private String loginName;

    @NotBlank(message = "密码不能为空")
    private String password;
}
