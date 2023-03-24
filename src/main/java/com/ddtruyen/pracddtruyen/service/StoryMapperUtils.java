package com.ddtruyen.pracddtruyen.service;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddtruyen.pracddtruyen.dto.StoryDTO;
import com.ddtruyen.pracddtruyen.entity.Story;

@Service
public class StoryMapperUtils {
  @Autowired
  private ModelMapper modelMapper;

  public StoryDTO convertToDTO(Story story) {
    return modelMapper.map(story, StoryDTO.class);
  }

  public Story convertToEntity(StoryDTO storyDTO) {
    return modelMapper.map(storyDTO, Story.class);
  }
}
