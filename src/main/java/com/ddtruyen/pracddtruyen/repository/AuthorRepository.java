package com.ddtruyen.pracddtruyen.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ddtruyen.pracddtruyen.entity.Author;

@Repository
public interface AuthorRepository extends JpaRepository<Author, Integer>{
  
}
