package com.ddtruyen.pracddtruyen.dto;

import java.time.LocalDate;
import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@ToString
public class StoryDTO {
  private Integer id;

  private String title;

  private String avatar;

  private LocalDate release_date;

  private String describe_story;

  private Integer status;
  
  private List<AuthorDTO> link_authors;
  
  private List<TypeDTO> link_types;
  
  private List<ChapterDTO> list_chapters;

  public StoryDTO(Integer id, String title, String avatar, LocalDate release_date, String describe_story,
      Integer status) {
    this.id = id;
    this.title = title;
    this.avatar = avatar;
    this.release_date = release_date;
    this.describe_story = describe_story;
    this.status = status;
  }
}
