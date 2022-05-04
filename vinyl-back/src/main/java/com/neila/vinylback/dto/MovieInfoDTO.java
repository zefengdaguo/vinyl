package com.neila.vinylback.dto;

import com.neila.vinylback.entity.Category;
import com.neila.vinylback.entity.Country;
import com.neila.vinylback.entity.Language;
import lombok.Data;

import java.time.LocalDate;
import java.util.List;

/**
 * Created by neila on 2022/4/3 23:11
 **/

/**
 * 电影页信息
 */
@Data
public class MovieInfoDTO {
    private int id;

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

    private List<Country> countries;

    private List<Language> languages;

    private List<Category> categories;
}
