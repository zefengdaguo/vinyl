package com.neila.vinylback.service;

/**
 * Created by neila on 2022/5/1 17:26
 **/

import com.neila.vinylback.mapper.ReviewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.Set;

/**
 * 定时将 redis 中的影评点赞数同步到 Mysql 中
 * 影评列表中查询的是 Mysql 的点赞数
 * 影评详情页是 redis 中的点赞数
 * 这里数据一致性的问题不重要，点赞功能主要实现判重
 */
@Service
public class ScheduledRedisLikeNumber2MySqlService {
    @Autowired
    RedisTemplate redisTemplate;
    @Autowired
    ReviewMapper reviewMapper;
    // 每1小时执行
    @Scheduled(cron = "0 0 * * * ?")
    public void syncLikeNumber(){
        Set keys = redisTemplate.keys("review:*");
        for (Object key : keys) {
            Long likeNumber = redisTemplate.opsForSet().size(key);
            int reviewId = Integer.parseInt(((String)key).split(":")[1]);
            reviewMapper.updateLikeNumber(likeNumber, reviewId);
        }
        System.out.println("更新了点赞数");
    }
}
