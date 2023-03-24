package com.ddtruyen.pracddtruyen.dto;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@ToString
public class TypeDTO {
  private Integer id;

  private String name;
  
  private List<StoryDTO> link_stories;

  public TypeDTO(Integer id, String name) {
    this.id = id;
    this.name = name;
  }
}
