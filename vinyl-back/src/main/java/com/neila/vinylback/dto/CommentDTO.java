package com.neila.vinylback.dto;

import lombok.Data;

/**
 * Created by neila on 2022/4/11 22:25
 **/

@Data
public class CommentDTO {
    private int id;

    private int userId;

    private String username;

    private int rate;

    private long date;

    private String comment;

    private int likeNumber;
}
