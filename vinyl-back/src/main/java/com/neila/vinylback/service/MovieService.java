package com.neila.vinylback.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.neila.vinylback.dto.*;
import com.neila.vinylback.entity.*;
import com.neila.vinylback.mapper.*;
import com.neila.vinylback.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by neila on 2022/3/27 17:02
 **/

@Service
public class MovieService {
    @Autowired
    MovieMapper movieMapper;
    @Autowired
    CategoryMapper categoryMapper;
    @Autowired
    CountryMapper countryMapper;
    @Autowired
    LanguageMapper languageMapper;
    @Autowired
    RoleMapper roleMapper;

    public boolean isMovieExist(int movieId) {
        if(movieId == 0 || movieMapper.getMovieTitleById(movieId) == null)
            return false;
        return true;
    }

    public boolean isTv(int movieId) {
        Integer isTv = movieMapper.isTv(movieId);
        if(isTv != null && isTv.equals(1))
            return true;
        return false;
    }

    public Result add(Movie movie) {
        String title = movie.getTitle();
        String originalTitle = movie.getOriginalTitle();
        String posterPath = movie.getPosterPath();

        movie.setTitle(title);
        movie.setOriginalTitle(originalTitle);
        movie.setPosterPath(posterPath);
        if(movie.getIsTv() == 0) {
            movie.setEpisodeNumber(0);
        }
        movieMapper.save(movie);

        // 更新关联表
        List<Country> countries = movie.getCountries();
        List<Language> languages = movie.getLanguages();
        List<Category> categories = movie.getCategories();

        int movieId = movie.getId();

        if(countries != null) {
            for (Country country : countries) {
                movieMapper.setCountry(movieId, country.getId());
            }
        }

        if(languages != null) {
            for (Language language : languages) {
                movieMapper.setLanguage(movieId, language.getId());
            }
        }

        if(categories != null) {
            for (Category category : categories) {
                movieMapper.setCategory(movieId, category.getId());
            }
        }

        return Result.succ(200, "录入成功", movieId);
    }

    public PageInfo<AdminMovieDTO> adminList(Integer isAble, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        return new PageInfo<>(movieMapper.adminList(isAble));
    }

    public Result audit(int id, int isAble) {
        movieMapper.audit(id, isAble);
        return Result.succ(200,"修改成功",null);
    }

    public Result getMovieInfo(int id) {
        return Result.succ(movieMapper.getMovieInfoDTOById(id));
    }

    public PageInfo<MovieBlockDTO> list(int pageNum, int pageSize, String sort, int[] categories, Integer personId) {
        PageHelper.startPage(pageNum,pageSize);
        return new PageInfo<>(movieMapper.list(sort, categories, personId));
    }

    public List<MoviePersonDTO> getPeople(int id) {
        return movieMapper.getPeople(id);
    }

    public Result addRoles(int movieId, MoviePersonRoleDTO[] moviePersonRoleDTOS) {
        movieMapper.addRoles(movieId, moviePersonRoleDTOS);
        return Result.succ(null);
    }

    public PageInfo<CommentDTO> getComments(int id, int pageNum, int pageSize, String sort) {
        PageHelper.startPage(pageNum,pageSize);
        return new PageInfo<>(movieMapper.getComment(id, sort));
    }

    public List<Category> listCategoires() {
        return categoryMapper.listAll();
    }

    public PageInfo<MovieBlockDTO> search(String title, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        return new PageInfo<>(movieMapper.search(title));
    }

    public List<Country> listCountries() {
        return countryMapper.listAll();
    }

    public List<Language> listLanguages() {
        return languageMapper.listAll();
    }

    public List<Role> listRoles() {
        return roleMapper.listAll();
    }

    public Movie adminId(int id) {
        return movieMapper.adminId(id);
    }
}
