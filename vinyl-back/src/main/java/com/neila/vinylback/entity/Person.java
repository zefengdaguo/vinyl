package com.neila.vinylback.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import java.time.LocalDate;

/**
 * Created by neila on 2022/3/28 15:51
 **/

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Person {
    private int id;

    @NotBlank(message = "姓名不能为空")
    private String name;

    private String originalName = "";

    private String profilePath = "";

    // 性别：0女；1男；2未知
    private byte gender = 2;

    private String introduction = "";

    private Country country = new Country();

    private LocalDate birthday = LocalDate.parse("0000-01-01");

    private int enabled = 0;

    private int submitter = 0;

    private long lastUpdate;

}
