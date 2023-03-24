package com.ddtruyen.pracddtruyen.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ChapterDTO {
  private Integer id;
  
  private Integer chapterNumber;

  private String content;
}
