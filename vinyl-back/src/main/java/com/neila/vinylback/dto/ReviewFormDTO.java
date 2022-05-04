package com.neila.vinylback.dto;

import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * Created by neila on 2022/4/4 23:00
 **/

// 编辑影评时的表单内容
@Data
public class ReviewFormDTO {

    private int id = 0;

    private int movieId;

    @NotBlank(message = "影评名不能为空")
    private String title;

    private String description;

    private String body;

}
