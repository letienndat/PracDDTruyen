package com.ddtruyen.pracddtruyen.service;

import java.io.File;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.springframework.stereotype.Service;

@Service
public class CarouselService {
  public Set<String> getListCarousel(String dir) {
    return Stream.of(new File(dir).listFiles())
      .filter(file -> !file.isDirectory())
      .map(File::getName)
      .collect(Collectors.toSet());
  }
}
