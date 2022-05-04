package com.neila.vinylback.config;

import cn.dev33.satoken.interceptor.SaAnnotationInterceptor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * Created by neila on 2022/3/20 11:51
 **/

@Configuration
public class MyWebConfigurer implements WebMvcConfigurer {
    @Value("${file.path}")
    private String filepath;

    @Value("${file.avatar}")
    private String avatar;
    @Value("${file.profile}")
    private String profilePath;
    @Value("${file.poster}")
    private String posterPath;
    @Value("${file.articleImg}")
    private String articleImgPath;
//    @Override
//    public void addCorsMappings(CorsRegistry registry) {
//        registry.addMapping("/**") // 所有的当前站点的请求地址，都支持跨域访问。
//                .allowedOriginPatterns("*") // 所有的外部域都可跨域访问。 如果是localhost则很难配置，因为在跨域请求的时候，外部域的解析可能是localhost、127.0.0.1、主机名
//                .allowCredentials(true) // 是否支持跨域用户凭证
//                .allowedMethods("GET","HEAD","POST","PUT","DELETE","OPTIONS") // 当前站点支持的跨域请求类型是什么
//                .maxAge(3600)   // 超时时长设置为1小时。 时间单位是秒。
//                .allowedHeaders("*");   // 放行哪些原始请求头部信息
//    }


    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 添加 SaToken 拦截器
        registry.addInterceptor(new SaAnnotationInterceptor()).addPathPatterns("/**");
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // 静态资源路径
        registry.addResourceHandler("file/**").addResourceLocations("file:"+filepath+"/");
        registry.addResourceHandler("avatar/**").addResourceLocations("file:"+avatar+"/");
        registry.addResourceHandler("profile/**").addResourceLocations("file:"+profilePath+"/");
        registry.addResourceHandler("poster/**").addResourceLocations("file:"+posterPath+"/");
        registry.addResourceHandler("articleImg/**").addResourceLocations("file:"+articleImgPath+"/");
    }
}
