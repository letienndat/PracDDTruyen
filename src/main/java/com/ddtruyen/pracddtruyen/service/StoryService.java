package com.ddtruyen.pracddtruyen.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ddtruyen.pracddtruyen.entity.Story;

@Service
public interface StoryService {
  List<Story> getListStories();
}
