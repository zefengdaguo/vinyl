package com.neila.vinylback.utils;

/**
 * Created by neila on 2022/3/21 16:01
 **/

import lombok.Data;

import java.io.Serializable;

/**
 Result类用于异步统一返回的结果封装。一般来说，结果里面有几个要素必要的
 - 是否成功，可用code表示（如200表示成功，400表示异常）
 - 结果消息
 - 结果数据
 */
@Data
public class Result implements Serializable {
    private int code;
    private String msg;
    private Object data;

    public static Result succ(Object data) {
        return succ(200, "操作成功", data);
    }

    public static Result succ(int code, String msg, Object data) {
        Result result = new Result();
        result.setCode(code);
        result.setData(data);
        result.setMsg(msg);
        return result;
    }

    public static Result fail(int code, String msg, Object data) {
        Result r = new Result();
        r.setCode(code);
        r.setData(data);
        r.setMsg(msg);
        return r;
    }

    public static Result fail(String msg, Object data) {
        return fail(400, msg, data);
    }

    public static Result fail(String msg) {
        return fail(400, msg, null);
    }
}
