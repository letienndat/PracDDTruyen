package com.ddtruyen.pracddtruyen.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ddtruyen.pracddtruyen.entity.Type;

@Service
public interface TypeService {
  List<Type> getListTypes();
}
