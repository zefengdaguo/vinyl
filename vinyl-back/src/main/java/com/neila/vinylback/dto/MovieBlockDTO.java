package com.neila.vinylback.dto;

import lombok.Data;

/**
 * Created by neila on 2022/4/1 18:18
 **/

/**
 * 列表中的 movie 信息
 */
@Data
public class MovieBlockDTO {
    private int id;

    private String title;

    private float rate;

    private String posterPath;
}
