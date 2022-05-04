package com.neila.vinylback.dto;

import lombok.Data;

/**
 * Created by neila on 2022/4/11 16:47
 **/

/**
 * 影片的演职员列表项
 */
@Data
public class MoviePersonDTO {
    private int personId;

    private String personName;

    private String profilePath;

    private String role;
}
