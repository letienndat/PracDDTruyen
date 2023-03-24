package com.ddtruyen.pracddtruyen.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ddtruyen.pracddtruyen.entity.Story;

@Repository
public interface StoryRepository extends JpaRepository<Story, Integer>{
  
}
