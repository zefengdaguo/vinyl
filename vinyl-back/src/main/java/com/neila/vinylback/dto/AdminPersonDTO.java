package com.neila.vinylback.dto;

import lombok.Data;

/**
 * Created by neila on 2022/4/13 11:13
 **/

@Data
public class AdminPersonDTO {
    private int id;

    private String name;

    private int enabled;

    private int submitter;
}
