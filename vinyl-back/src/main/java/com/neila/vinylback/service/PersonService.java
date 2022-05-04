package com.neila.vinylback.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.neila.vinylback.dto.PersonBlockDTO;
import com.neila.vinylback.entity.Person;
import com.neila.vinylback.mapper.PersonMapper;
import com.neila.vinylback.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * Created by neila on 2022/3/28 16:15
 **/

@Service
public class PersonService {
    @Autowired
    PersonMapper personMapper;

    public Result add(Person person) {
        String name = person.getName();
        String originalName = person.getOriginalName();
        String introduction = person.getIntroduction();
        String profilePath = person.getProfilePath();

        person.setName(name);
        person.setOriginalName(originalName);
        person.setIntroduction(introduction);
        person.setProfilePath(profilePath);

        personMapper.save(person);
        return Result.succ(200,"添加成功",null);
    }

    public PageInfo<Person> adminList(Integer enabled,int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        return new PageInfo<>(personMapper.adminList(enabled));
    }

    public Result audit(int id,int enabled) {
        personMapper.audit(id, enabled);
        return Result.succ(200,"修改成功",null);
    }

    public Person getPersonById(int id) {
        return personMapper.getPersonById(id);
    }

    public PageInfo<PersonBlockDTO> search(String name, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        return new PageInfo<>(personMapper.search(name));
    }

    public Person admniId(int id) {
        return personMapper.adminId(id);
    }
}
