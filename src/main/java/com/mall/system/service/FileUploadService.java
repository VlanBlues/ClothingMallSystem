package com.mall.system.service;

import com.mall.system.util.Result;
import org.springframework.web.multipart.MultipartFile;

/**
 * Author: Vlan
 * Date: 2021/2/2 10:54
 */
public interface FileUploadService {
    Result singleUpload(MultipartFile file);

    Result singleUpload2(MultipartFile file);
    
    Result multipleUpload(MultipartFile[] files);
}
