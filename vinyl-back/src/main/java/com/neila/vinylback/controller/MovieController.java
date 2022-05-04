package com.neila.vinylback.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.stp.StpUtil;
import com.neila.vinylback.dto.MoviePersonRoleDTO;
import com.neila.vinylback.entity.Movie;
import com.neila.vinylback.exception.NotLoginException;
import com.neila.vinylback.service.MovieService;
import com.neila.vinylback.utils.Result;
import com.neila.vinylback.utils.StpAdminUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;



/**
 * Created by neila on 2022/3/27 17:03
 **/

@RequestMapping("/movie")
@Controller
public class MovieController {
    @Autowired
    MovieService movieService;

    // 用户提交资料，需审核
    @SaCheckLogin
    @PostMapping("/add")
    @ResponseBody
    public Result add(@Validated @RequestBody Movie movie) {
        movie.setIsAble(0);
        movie.setCreator(Integer.parseInt((String) StpUtil.getLoginId()));
        movie.setLastUpdate(System.currentTimeMillis());
        return movieService.add(movie);
    }

    // 管理员提交，不需要审核
    @SaCheckLogin(type = StpAdminUtil.TYPE)
    @PostMapping("/save")
    @ResponseBody
    public Result save(@Validated @RequestBody Movie movie) {
        movie.setIsAble(1);
        movie.setCreator(0);
        movie.setLastUpdate(System.currentTimeMillis());
        return movieService.add(movie);
    }

    /**
     * @param isAble 可选参数，列出所有，0 未审核，1 已通过
     * @return
     */
    @SaCheckLogin(type = StpAdminUtil.TYPE)
    @GetMapping("/adminlist")
    @ResponseBody
    public Result adminList(Integer isAble, int pageNum, int pageSize) {
        return Result.succ(movieService.adminList(isAble,pageNum,pageSize));
    }

    @GetMapping("/admin/{id}")
    @ResponseBody
    @SaCheckLogin(type = StpAdminUtil.TYPE)
    public Result adminId(@PathVariable("id") int id) {
        return Result.succ(movieService.adminId(id));
    }

    @GetMapping("/search")
    @ResponseBody
    public Result search(String title, int pageNum, int pageSize) {
        return Result.succ(movieService.search("%"+title+"%",pageNum,pageSize));
    }

    /**
     * 影片列表
     * @param sort 排序方式，默认时间排序，可指定为 'rate' 按评分排序
     * @param categories 限定类型（结果是并集），不指定则列出所有类型影片
     * @param personId 限定影人
     * @return
     */
    @GetMapping("/list")
    @ResponseBody
    public Result list(int pageNum, int pageSize, String sort, int[] categories, Integer personId) {
        return Result.succ(movieService.list(pageNum,pageSize,sort,categories,personId));
    }

    @GetMapping("/{id}")
    @ResponseBody
    public Result getMovieInfo(@PathVariable("id") int id) {
        return movieService.getMovieInfo(id);
    }

    // 管理员通过用户的提交
    @SaCheckLogin(type = StpAdminUtil.TYPE)
    @PutMapping("/audit/{id}")
    @ResponseBody
    public Result audit(@PathVariable("id") int id, int isAble) {
        return movieService.audit(id,isAble);
    }

    @PostMapping("/{id}/addRoles")
    @ResponseBody
    public Result addRole(@PathVariable("id") int movieId, @RequestBody MoviePersonRoleDTO[] moviePersonRoleDTOS) {
        if(StpUtil.isLogin() || StpAdminUtil.isLogin())
            return movieService.addRoles(movieId, moviePersonRoleDTOS);
        throw new NotLoginException();
    }

    @GetMapping("/{id}/people")
    @ResponseBody
    public Result getPeople(@PathVariable int id) {
        return Result.succ(movieService.getPeople(id));
    }

    /**
     * @param sort 可选 'rate' 按评价排序，默认按时间排序
     */
    @GetMapping("/{id}/comments")
    @ResponseBody
    public Result getComments(@PathVariable("id") int id, int pageNum, int pageSize, String sort) {
        return Result.succ(movieService.getComments(id, pageNum, pageSize, sort));
    }

    @GetMapping("/{id}/reviews")
    public String getReviews(@PathVariable("id") int id, int pageNum, int pageSize) {
        return "forward:/review/list?pageNum="+pageNum+"&pageSize="+pageSize+"&movieId="+id;
    }

    @GetMapping("/categories")
    @ResponseBody
    public Result listCategories() {
        return Result.succ(movieService.listCategoires());
    }

    @GetMapping("/countries")
    @ResponseBody
    public Result listCountries() {
        return Result.succ(movieService.listCountries());
    }

    @GetMapping("/languages")
    @ResponseBody
    public Result listLanguages() {
        return Result.succ(movieService.listLanguages());
    }

    @GetMapping("/roles")
    @ResponseBody
    public Result listRoles() {
        return Result.succ(movieService.listRoles());
    }
}
