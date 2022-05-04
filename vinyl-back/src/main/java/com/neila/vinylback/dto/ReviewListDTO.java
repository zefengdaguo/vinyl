package com.neila.vinylback.dto;

import lombok.Data;

/**
 * Created by neila on 2022/4/5 17:56
 **/

@Data
public class ReviewListDTO {
    private int id;

    private String title;

    private String description;

    private int userId;

    private String authorName;

    private String userAvatar;

    private int movieId;

    private String movieTitle;

    private String moviePoster;

    private int likeNumber;

    private long date;

}
