package com.ddtruyen.pracddtruyen.entity;

import java.time.LocalDate;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@ToString
@Entity
@Table(name = "story")
public class Story {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id", columnDefinition = "int(11)")
  private Integer id;

  @Column(name = "title", columnDefinition = "nvarchar(255)")
  private String title;

  @Column(name = "avatar", columnDefinition = "nvarchar(255)")
  private String avatar;

  @Column(name = "release_date", columnDefinition = "date")
  private LocalDate release_date;

  @Column(name = "describe_story", columnDefinition = "nvarchar(255)")
  private String describe_story;

  @Column(name = "status", columnDefinition = "boolean")
  private Boolean status;

  @ManyToMany(cascade = CascadeType.ALL)
  @JoinTable(
    name = "story_author", 
    joinColumns = @JoinColumn(name = "id_story"), 
    inverseJoinColumns = @JoinColumn(name = "id_author"))
  private List<Author> linkAuthors;

  @ManyToMany
  @JoinTable(
    name = "story_type",
    joinColumns = @JoinColumn(name = "id_story"),
    inverseJoinColumns = @JoinColumn(name = "id_type")
  )
  private List<Type> linkTypes;

  @OneToMany(mappedBy = "story")
  private List<Chapter> listChapters;

  public Story(String title, String avatar, LocalDate release_date, String describe_story) {
    this.title = title;
    this.avatar = avatar;
    this.release_date = release_date;
    this.describe_story = describe_story;
  }
}
