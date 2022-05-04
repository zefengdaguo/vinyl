package com.neila.vinylback.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

/**
 * Created by neila on 2022/3/19 17:48
 **/

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {

    private int id;

    @NotBlank(message = "用户名不能为空")
    private String username;

    @NotBlank(message = "密码不能为空")
    private String password;

    private String salt;

    @Email(message = "邮箱格式错误")
    private String email;

    @Pattern(regexp = "(1[3-9]\\d{9})?", message = "请输入合法的11位手机号")
    private String phone = "";

    private String avatarPath = "";

    private String profile = "";

    // 0 正常；1 封禁
    private int status = 0;

    private long created;

    private long lastLogin;
}
