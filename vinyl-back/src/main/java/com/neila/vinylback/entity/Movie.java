package com.neila.vinylback.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import java.time.LocalDate;
import java.util.List;

/**
 * Created by neila on 2022/3/27 13:56
 **/

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Movie {
    private int id;

    @NotBlank(message = "片名不能为空")
    private String title;

    private String originalTitle = "";

    private int year = 0;

    private LocalDate releaseDate = LocalDate.parse("0000-01-01");

    private String posterPath = "";

    private int runtime = 0;

    // 0 电影；1 剧集
    private int isTv = 0;

    private int episodeNumber = 0;

    private float rate = (float) 0.0;

    private String overview = "";

    private int isAble = 0;

    // 创建资料的用户的id，0表示管理员
    private int creator;

    private List<Country> countries;

    private List<Language> languages;

    private List<Category> categories;

    private long lastUpdate;

}
