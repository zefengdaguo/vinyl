package com.neila.vinylback.dto;

import lombok.Data;

import java.time.LocalDate;

/**
 * Created by neila on 2022/4/11 13:21
 **/

/**
 * 用户 mark 列表项
 */
@Data
public class MovieListDTO {
    // 影片 id
    private int movieId;

    private String title;

    private String originalTitle;

    private String posterPath;

    private int year;

    private LocalDate releaseDate;

    // 标记日期
    private long markDate;

    // 用户评分
    private int rate;

    private String comment;

    private int isTv;
}
