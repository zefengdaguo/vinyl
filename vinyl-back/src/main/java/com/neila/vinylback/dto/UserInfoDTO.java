package com.neila.vinylback.dto;

import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * Created by neila on 2022/4/12 21:26
 **/

@Data
public class UserInfoDTO {
    private int id;

    @NotBlank(message = "用户名不能为空")
    private String username;

    private String avatarPath = "";

    private String profile = "";
}
