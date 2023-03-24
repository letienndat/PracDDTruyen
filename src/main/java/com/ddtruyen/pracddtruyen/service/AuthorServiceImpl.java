package com.ddtruyen.pracddtruyen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddtruyen.pracddtruyen.entity.Author;
import com.ddtruyen.pracddtruyen.repository.AuthorRepository;

import lombok.Getter;

@Service
@Getter
public class AuthorServiceImpl implements AuthorService {
  @Autowired
  private AuthorRepository authorRepository;

  @Override
  public List<Author> getListAuthors() {
    return authorRepository.findAll();
  }
}
