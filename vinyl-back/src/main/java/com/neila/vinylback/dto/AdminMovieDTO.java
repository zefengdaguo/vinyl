package com.neila.vinylback.dto;

import lombok.Data;

/**
 * Created by neila on 2022/4/13 10:27
 **/

@Data
public class AdminMovieDTO {
    private int id;

    private String title;

    // 创建资料的用户的id，0表示管理员
    private int creator;

    private int isAble;
}
