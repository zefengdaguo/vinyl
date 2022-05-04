package com.neila.vinylback.entity;

import lombok.Data;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

/**
 * Created by neila on 2022/4/10 18:19
 **/

@Data
public class UserMovie {

    private int id = 0;

    private int userId;

    private int movieId;

    @Max(value = 10)
    @Min(value = 0)
    private int rate = 0;

    private int status;

    private long date;

    private String comment = "";

    private int likeNumber = 0;
}
