package com.ddtruyen.pracddtruyen.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ddtruyen.pracddtruyen.entity.Author;

@Service
public interface AuthorService {
  List<Author> getListAuthors();
}
