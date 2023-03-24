package com.ddtruyen.pracddtruyen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddtruyen.pracddtruyen.entity.Story;
import com.ddtruyen.pracddtruyen.repository.StoryRepository;

import lombok.Getter;

@Service
@Getter
public class StoryServiceImpl implements StoryService{
  @Autowired
  private StoryRepository storyRepository;

  @Override
  public List<Story> getListStories() {
    return storyRepository.findAll();
  }
}
