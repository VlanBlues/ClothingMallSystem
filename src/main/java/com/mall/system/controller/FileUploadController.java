package com.mall.system.controller;

import com.mall.system.service.FileUploadService;
import com.mall.system.util.Result;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;

/**
 * Author: Vlan
 * Date: 2021/2/2 10:18
 */
@RestController
@RequestMapping("/img")
public class FileUploadController {

    @Resource
    private FileUploadService fileUploadService;

    @RequestMapping("/upload")
    public Result singleUpload(@RequestParam("file") MultipartFile file){
        return fileUploadService.singleUpload(file);
    }

    //这种方式上传的时间短
    @PostMapping("/upload2")
    public Result singleUpload2(@RequestParam("file") MultipartFile file){
        return fileUploadService.singleUpload2(file);
    }

    //多文件上传
    @RequestMapping("/multipleUpload")
    public Result multipleUpload(@RequestParam("files") MultipartFile[] files){
        return fileUploadService.multipleUpload(files);
    }
}
