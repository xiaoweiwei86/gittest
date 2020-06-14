package com.chl.applet.controller;

import com.chl.applet.entity.ImgInfo;
import com.chl.applet.util.UploadUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;

/**
 * 经验数据库上传图片
 */
@Controller
public class UploadFileController {
    @Value("${upload-dir}")
    private String uploadDir;
    @Value("${img-url}")
    private String imgUrl;

    @RequestMapping("de/upload")
    @ResponseBody
    public ImgInfo setImgUrl(MultipartFile file, HttpServletResponse response, HttpServletRequest request)
            throws Exception {

        byte[] bytes = file.getBytes();

        //产生一个日期目录
        SimpleDateFormat format=new SimpleDateFormat("YYYY-MM-dd");
        String dateDir = format.format(new Date());

        File imgFile = new File(uploadDir+"\\"+dateDir);
        if (!imgFile.exists()) {
            imgFile.mkdirs();
        }
        String fileName = file.getOriginalFilename();// 文件名称

        //生成一个uuid名称出来
        String uuidFilename = UploadUtils.getUUIDName(fileName);
        System.out.println(uploadDir +"\\"+dateDir+"\\"+ uuidFilename);

        try (FileOutputStream fos = new FileOutputStream(new File(uploadDir +"\\"+dateDir+"\\"+ uuidFilename))) {
            int len = 0;
            fos.write(bytes);
        } catch (Exception e) {
            e.printStackTrace();
        }

        String value = imgUrl +"/"+dateDir+"/"+uuidFilename;
        String[] values = {value};
        ImgInfo imgInfo = new ImgInfo();
        imgInfo.setError(0);
        imgInfo.setUrl(values);
        System.out.println(Arrays.toString(imgInfo.getUrl()));
        return imgInfo;
    }

}
