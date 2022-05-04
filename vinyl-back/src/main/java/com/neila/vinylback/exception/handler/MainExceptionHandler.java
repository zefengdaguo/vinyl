package com.neila.vinylback.exception.handler;

/**
 * Created by neila on 2022/4/2 17:53
 **/

import com.neila.vinylback.exception.*;
import com.neila.vinylback.utils.Result;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.sql.SQLIntegrityConstraintViolationException;

/**
 * https://fookwood.com/spring-boot-tutorial-25-rest-codes
 */

/**
 * 为了直观，Result 的 code 与 http 状态码一致
 * 一般来说，Result 的 code 应该有专门的定义，业务码不应与 http 状态码混用
 */

@RestControllerAdvice
public class MainExceptionHandler {

    @ExceptionHandler(UserNotFoundException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)   // 设置响应状态码
    public Result userNotFound() {
        return Result.fail(400,"该用户不存在",null);
    }

    @ExceptionHandler(HasLoginException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public Result hasLogin() {
        return Result.fail(400,"已登录",null);
    }

    @ExceptionHandler(AdminNotFoundException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public Result adminNotFound() {
        return Result.fail(400,"该管理员不存在",null);
    }

    @ExceptionHandler(EmailExistException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public Result emailExist() {
        return Result.fail(400,"该邮箱已存在",null);
    }

    @ExceptionHandler(FileFormatException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public Result fileFormat() {
        return Result.fail(400,"文件格式错误",null);
    }

    @ExceptionHandler(FileNotChooseException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public Result fileNotChoose() {
        return Result.fail(400,"未选择文件",null);
    }

    @ExceptionHandler(NotLoginException.class)
    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    public Result notLogin() {
        return Result.fail(401,"未登录",null);
    }

    @ExceptionHandler(PasswordException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public Result password() {
        return Result.fail(400,"密码错误",null);
    }

    @ExceptionHandler(UploadException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public Result upload() {
        return Result.fail(400,"上传失败",null);
    }

    @ExceptionHandler(UserDisableException.class)
    @ResponseStatus(HttpStatus.FORBIDDEN)
    public Result userDisable() {
        return Result.fail(403,"该用户已禁用",null);
    }

    @ExceptionHandler(UsernameExistException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public Result usernameExist() {
        return Result.fail(400,"用户名已被注册",null);
    }

    @ExceptionHandler(NotReviewAuthorException.class)
    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    public Result notReviewAuthor() {
        return Result.fail(401,"不是该影评作者，无权编辑",null);
    }

    @ExceptionHandler(HasReviewException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public Result hasReview() {
        return Result.fail(400,"已写过该片影评",null);
    }

    @ExceptionHandler(MovieNotExistException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public Result movieNotExist() {
        return Result.fail(400,"该片不存在",null);
    }

    @ExceptionHandler(NotTvException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public Result notTv() {
        return Result.fail(400,"不是电视剧，无法标记在看",null);
    }
}
