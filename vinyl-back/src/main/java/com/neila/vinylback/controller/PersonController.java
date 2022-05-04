package com.neila.vinylback.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.stp.StpUtil;
import com.neila.vinylback.entity.Person;
import com.neila.vinylback.service.PersonService;
import com.neila.vinylback.utils.Result;
import com.neila.vinylback.utils.StpAdminUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * Created by neila on 2022/3/28 16:14
 **/

@RequestMapping("/person")
@RestController
public class PersonController {
    @Autowired
    PersonService personService;

    // 用户提交资料，需审核
    @SaCheckLogin
    @PostMapping("/add")
    public Result add(@Validated @RequestBody Person person) {
        person.setEnabled(0);
        person.setSubmitter(Integer.parseInt((String) StpUtil.getLoginId()));
        person.setLastUpdate(System.currentTimeMillis());
        return personService.add(person);
    }

    // 管理员提交，不需要审核
    @SaCheckLogin(type = StpAdminUtil.TYPE)
    @PostMapping("/save")
    public Result save(@Validated @RequestBody Person person) {
        person.setEnabled(1);
        person.setSubmitter(0);
        person.setLastUpdate(System.currentTimeMillis());
        return personService.add(person);
    }

    /**
     * @param enabled 可选参数，0 未通过，1 已审核
     * @return
     */
    @SaCheckLogin(type = StpAdminUtil.TYPE)
    @GetMapping("/adminlist")
    public Result adminList(Integer enabled, int pageNum, int pageSize) {
        return Result.succ(personService.adminList(enabled,pageNum,pageSize));
    }

    // 管理员通过用户的提交
    @SaCheckLogin(type = StpAdminUtil.TYPE)
    @PutMapping("/audit/{id}")
    public Result audit(@PathVariable("id") int id, int enabled) {
        return personService.audit(id,enabled);
    }

    @GetMapping("/{id}")
    public Result getPersonById(@PathVariable("id") int id) {
        return Result.succ(personService.getPersonById(id));
    }

    @GetMapping("/admin/{id}")
    @SaCheckLogin(type = StpAdminUtil.TYPE)
    public Result adminId(@PathVariable("id") int id) {
        return Result.succ(personService.admniId(id));
    }

    @GetMapping("/search")
    public Result search(String name, int pageNum, int pageSize) {
        return Result.succ(personService.search("%"+name+"%",pageNum,pageSize));
    }

}
