package com.neila.vinylback.service;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.io.FileTypeUtil;
import com.neila.vinylback.exception.FileFormatException;
import com.neila.vinylback.exception.FileNotChooseException;
import com.neila.vinylback.exception.UploadException;
import com.neila.vinylback.utils.FileToHex;
import com.neila.vinylback.utils.Result;
import com.neila.vinylback.mapper.UserMapper;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * Created by neila on 2022/3/23 15:31
 **/

@Slf4j
@Service
public class ImageService {
    @Value("${file.avatar}")
    private String avatarPath;
    @Value("${file.profile}")
    private String profilePath;
    @Value("${file.poster}")
    private String posterPath;
    @Value("${file.articleImg}")
    private String articleImgPath;

    @Autowired
    UserMapper userMapper;

    enum Type {
        AVATAR(0),
        PROFILE(1),
        POSTER(2),
        ARTICLE_IMG(3);

        public final int type;

        private Type(int i) {
            this.type = i;
        }
    }

    public Result uploadImage(MultipartFile file, Type type) {

        long size = file.getSize();

        log.info("文件大小：{}",size);

        String path = "";
        if(type == Type.AVATAR)
            path = avatarPath;
        else if(type == Type.PROFILE)
            path = profilePath;
        else if(type == Type.POSTER)
            path = posterPath;
        else
            path = articleImgPath;

        if(!file.isEmpty()){
            try {
                // 判断文件类型
                String filetype = FileTypeUtil.getType(file.getInputStream());
                // 由于 Hutool 还没有 webp 类型，会返回 null，这里简单实现一个 webp 类型文件判断
                if(filetype == null) {
                    String s = FileToHex.getHeader(file.getInputStream());
                    // 如果不符合 webp 文件头，抛出异常
                    if(s.substring(0,8).equals("52494646") && s.substring(16,24).equals("57454250"))
                        filetype = "webp";
                    else
                        throw new FileFormatException();
                } else if(!filetype.equals("jpg")&&!filetype.equals("png")&&!filetype.equals("gif"))
                    throw new FileFormatException();

                String originalFilename = file.getOriginalFilename();
                String fileSuffix = originalFilename.substring(originalFilename.lastIndexOf('.'));
                String filename = UUID.randomUUID() + fileSuffix;

                File dest = new File(path + "/" + filename);
                //检测目录是否存在
                if (!dest.getParentFile().exists()) {
                    dest.getParentFile().mkdirs();
                }
                file.transferTo(dest);
                /**
                 * 如果是头像需要更新数据库
                 * 电影海报和影人图是在上传后将图片名返回给前端表单，连同表单其他信息一起上传，这里不需要更新数据库
                 */
                if(type == Type.AVATAR)
                    userMapper.updateAvatarPath(filename, Integer.parseInt((String) StpUtil.getLoginId()));
                // 图片压缩
                if(!filetype.equals("webp")) {
                    Thumbnails.of(path + "/" + filename)
                            .scale(1f)  // 不缩放
                            .outputQuality(0.7F)    // 原图品质（0-1）
                            .toFile(path + "/" + filename);
                    log.info("图片压缩成功");
                }

                return Result.succ(filename);
            } catch (IOException e) {
                e.printStackTrace();
                throw new UploadException();
            }
        } else {
            throw new FileNotChooseException();
        }
    }

    public Result uploadAvatar(MultipartFile file) {
        return uploadImage(file, Type.AVATAR);
    }
    public Result uploadProfile(MultipartFile file) {
        return uploadImage(file, Type.PROFILE);
    }
    public Result uploadPoster(MultipartFile file) {
        return uploadImage(file, Type.POSTER);
    }
    public Result uploadArticleImg(MultipartFile file) {
        return uploadImage(file, Type.ARTICLE_IMG);
    }
}
