package com.neila.vinylback;

import cn.dev33.satoken.SaManager;
import com.neila.vinylback.mapper.MovieMapper;
import com.neila.vinylback.mapper.UserMapper;
import com.neila.vinylback.service.RegisterService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;

import java.util.Set;

@SpringBootTest
class VinylBackApplicationTests {
	@Value("${file.path}")
	private String filepath;
	@Test
	void contextLoads() {
		System.out.println(filepath);
	}
	@Test
	void SaTokenTest() {
		System.out.println("启动成功：Sa-Token配置如下：" + SaManager.getConfig());
	}
	@Autowired
	UserMapper userMapper;
	@Test
	void testMapper() {
		System.out.println(userMapper.isEmailExist("123@email.com"));
	}
	@Autowired
	RegisterService registerService;

	@Autowired
	MovieMapper movieMapper;
	@Test
	void outInt(){
		System.out.println(movieMapper.isTv(1));
		System.out.println(movieMapper.isTv(2));
		System.out.println(movieMapper.isTv(2) == 1);
		System.out.println(movieMapper.isTv(2).equals(1));
		System.out.println(movieMapper.isTv(8));
		System.out.println(movieMapper.isTv(8) == 0);
		System.out.println(movieMapper.isTv(88));
		System.out.println(movieMapper.isTv(88).equals(0));
	}

	@Autowired
	RedisTemplate redisTemplate;
	@Test
	void keys() {
		Set keys = redisTemplate.keys("review:*");
		System.out.println(keys.size());
		for (Object key : keys) {
			System.out.println(Integer.parseInt(((String)key).split(":")[1]));
		}
	}

}
