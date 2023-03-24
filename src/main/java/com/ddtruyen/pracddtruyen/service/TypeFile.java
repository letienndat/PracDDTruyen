package com.ddtruyen.pracddtruyen.service;

import java.util.Optional;

import org.springframework.stereotype.Service;

@Service
public class TypeFile {
  public Optional<String> getTypeFile(String fileName) {
    return Optional.ofNullable(fileName)
    .filter(f -> f.contains("."))
    .map(f -> f.substring(f.lastIndexOf(".") + 1));
  }
}
