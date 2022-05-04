package com.neila.vinylback.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;

/**
 * Created by neila on 2022/3/21 13:10
 **/

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO {
    private int id;

    @NotBlank(message = "用户名不能为空")
    private String username;

    private String avatarPath;

    private int status;
}
