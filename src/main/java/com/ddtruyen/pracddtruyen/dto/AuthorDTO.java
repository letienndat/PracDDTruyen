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
public class AuthorDTO {
  private Integer id;

  private String name;

  private String avatar;

  private String address;

  private String describe_author;
  
  private List<StoryDTO> link_stories;

  public AuthorDTO(Integer id, String name, String avatar, String address, String describe_author) {
    this.id = id;
    this.name = name;
    this.avatar = avatar;
    this.address = address;
    this.describe_author = describe_author;
  }
}
