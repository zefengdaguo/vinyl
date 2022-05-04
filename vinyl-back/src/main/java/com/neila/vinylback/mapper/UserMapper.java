package com.neila.vinylback.mapper;

import com.neila.vinylback.dto.UserDTO;
import com.neila.vinylback.dto.UserInfoDTO;
import com.neila.vinylback.entity.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by neila on 2022/3/21 12:59
 **/

@Mapper
@Repository
public interface UserMapper {
    @Select("select * from user where username = #{username}")
    User findByUsername(String username);

    @Select("select email from user where email = #{email}")
    String isEmailExist(String email);

    @Insert("insert into user(username,password,salt,email,phone,avatar_path,profile,status,created,last_login) values (#{username},#{password},#{salt},#{email},#{phone},#{avatarPath},#{profile},#{status},#{created},#{lastLogin})")
    int save(User user);

    @Update("update user set last_login = #{lastLogin} where id = #{id}")
    int updateLastLogin(int id, long lastLogin);

    @Update("update user set avatar_path = #{path} where id = #{id}")
    int updateAvatarPath(String path, int id);

    @Select("select username from user where id = #{id}")
    String getUsernameById(int id);

    List<UserDTO> list(String username);

    @Update("update user set status = #{disable} where id = #{userId}")
    int status(int userId, int disable);

    @Select("select id, username, avatar_path, profile from user where id = #{id} and status = 0")
    UserInfoDTO getUserInfoById(int id);
}
