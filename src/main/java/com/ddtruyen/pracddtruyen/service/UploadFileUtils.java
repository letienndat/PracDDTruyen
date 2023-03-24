package com.ddtruyen.pracddtruyen.service;

import java.io.File;
import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class UploadFileUtils {
  public File handUploadFile(MultipartFile uploadFile, String dir) {
    File myUploadFile = new File(dir);
    if(!myUploadFile.exists()) {
      myUploadFile.mkdirs();
    }

    File saveFile = null;
    try {
      saveFile = new File(myUploadFile, getTypeFile(uploadFile.getOriginalFilename())
      .isEmpty() ? uploadFile.getOriginalFilename()
       : uploadFile.getOriginalFilename() + "." + getTypeFile(uploadFile.getOriginalFilename()).get());
      uploadFile.transferTo(saveFile);
    } catch (Exception e) {
      e.printStackTrace();
    }

    return saveFile;
  }
  
  public File handUploadFile(MultipartFile uploadFile, String dir, String fileName) {
    File myUploadFile = new File(dir);
    if(!myUploadFile.exists()) {
      myUploadFile.mkdirs();
    }

    File saveFile = null;
    try {
      saveFile = new File(myUploadFile, fileName);
      uploadFile.transferTo(saveFile);
    } catch (Exception e) {
      e.printStackTrace();
    }

    return saveFile;
  }

  public Optional<String> getTypeFile(String fileName) {
    return Optional.ofNullable(fileName)
    .filter(f -> f.contains("."))
    .map(f -> f.substring(f.lastIndexOf(".") + 1));
  }
}
