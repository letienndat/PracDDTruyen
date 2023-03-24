package com.ddtruyen.pracddtruyen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddtruyen.pracddtruyen.entity.Type;
import com.ddtruyen.pracddtruyen.repository.TypeRepository;

import lombok.Getter;

@Service
@Getter
public class TypeServiceImpl implements TypeService {
  @Autowired
  private TypeRepository typeRepository;

  @Override
  public List<Type> getListTypes() {
    return typeRepository.findAll();
  }
}
