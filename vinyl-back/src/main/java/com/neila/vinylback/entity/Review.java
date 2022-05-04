package com.neila.vinylback.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;

/**
 * Created by neila on 2022/4/4 21:52
 **/

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Review {
    private int id = 0;

    private int userId;

    private int movieId;

    @NotBlank(message = "影评名不能为空")
    private String title;

    private String description;

    private String body;

    private int likeNumber = 0;

    private long date;
}
