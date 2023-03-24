package com.ddtruyen.pracddtruyen.service;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;

import com.ddtruyen.pracddtruyen.dto.ChapterDTO;
import com.ddtruyen.pracddtruyen.entity.Chapter;

public class ChapterMapperUtils {
  @Autowired
  private ModelMapper modelMapper;

  public ChapterDTO convertToDTO(Chapter chapter) {
    return modelMapper.map(chapter, ChapterDTO.class);
  }

  public Chapter convertToEntity(ChapterDTO chapterDTO) {
    return modelMapper.map(chapterDTO, Chapter.class);
  }
}
