package com.ddtruyen.pracddtruyen.service;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddtruyen.pracddtruyen.dto.TypeDTO;
import com.ddtruyen.pracddtruyen.entity.Type;

@Service
public class TypeMapperUtils {
  @Autowired
  private ModelMapper modelMapper;

  public TypeDTO convertToDTO(Type type) {
    return modelMapper.map(type, TypeDTO.class);
  }

  public Type convertToEntity(TypeDTO typeDTO) {
    return modelMapper.map(typeDTO, Type.class);
  }
}
