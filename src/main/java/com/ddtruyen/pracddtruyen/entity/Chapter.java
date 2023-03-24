package com.ddtruyen.pracddtruyen.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Table(name = "chapter")
public class Chapter {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id", columnDefinition = "int(11)")
  private Integer id;

  @Column(name = "chapter_number", columnDefinition = "int(11)")
  private Integer chapter_number;

  @Column(name = "content", columnDefinition = "nvarchar(255)")
  private String content;

  @ManyToOne
  @JoinColumn(name = "id_story", referencedColumnName = "id")
  private Story story;
}
