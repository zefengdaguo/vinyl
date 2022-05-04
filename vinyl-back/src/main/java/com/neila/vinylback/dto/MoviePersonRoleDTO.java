package com.neila.vinylback.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Created by neila on 2022/4/11 18:00
 **/

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MoviePersonRoleDTO {
    private int personId;

    private int roleId;
}
