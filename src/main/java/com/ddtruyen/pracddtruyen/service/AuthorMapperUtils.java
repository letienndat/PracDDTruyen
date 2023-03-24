package com.ddtruyen.pracddtruyen.service;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddtruyen.pracddtruyen.dto.AuthorDTO;
import com.ddtruyen.pracddtruyen.entity.Author;

@Service
public class AuthorMapperUtils {
  @Autowired
  private ModelMapper modelMapper;

  public AuthorDTO convertToDTO(Author author) {
    return modelMapper.map(author, AuthorDTO.class);
  }

  public Author convertToEntity(AuthorDTO authorDTO) {
    return modelMapper.map(authorDTO, Author.class);
  }
}
