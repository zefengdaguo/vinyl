package com.neila.vinylback.service;

import cn.dev33.satoken.stp.StpUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.neila.vinylback.dto.MovieListDTO;
import com.neila.vinylback.entity.UserMovie;
import com.neila.vinylback.exception.MovieNotExistException;
import com.neila.vinylback.exception.NotTvException;
import com.neila.vinylback.mapper.WatchMapper;
import com.neila.vinylback.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by neila on 2022/4/10 17:57
 **/

@Service
public class WatchService {
    @Autowired
    WatchMapper watchMapper;
    @Autowired
    MovieService movieService;

    public UserMovie getByUserIdAndMovieId(int userId, int movieId) {
        return watchMapper.getByUserIdAndMovieId(userId, movieId);
    }

    /**
     * @param status 0想看；1已看；2在看
     * @return
     */
    public Result mark(UserMovie userMovie, int status) {
        userMovie.setUserId(Integer.parseInt((String) StpUtil.getLoginId()));
        userMovie.setStatus(status);
        userMovie.setDate(System.currentTimeMillis());
        userMovie.setLikeNumber(0);
        userMovie.setComment(userMovie.getComment());
        if(!movieService.isMovieExist(userMovie.getMovieId()))
            throw new MovieNotExistException();
        if(userMovie.getStatus() == 2 && !movieService.isTv(userMovie.getMovieId()))
            throw new NotTvException();
        UserMovie temp = getByUserIdAndMovieId(userMovie.getUserId(),userMovie.getMovieId());
        if(temp == null) {
            watchMapper.insert(userMovie);
        } else {
            userMovie.setId(temp.getId());
            watchMapper.update(userMovie);
        }
        return Result.succ(null);
    }

    public Result del(int movieId) {
        watchMapper.del(Integer.parseInt((String) StpUtil.getLoginId()),movieId);
        return Result.succ(null);
    }

    /**
     * @param sort 排序方式，默认时间排序，可指定为 'rate' 按评分排序
     * @param status 0想看；1已看；2在看
     * @return
     */
    public PageInfo<MovieListDTO> list(int pageNum, int pageSize, String sort, int status, int userId) {
        PageHelper.startPage(pageNum,pageSize);
        return new PageInfo<>(watchMapper.getWatchList(userId, sort, status));
    }

}
