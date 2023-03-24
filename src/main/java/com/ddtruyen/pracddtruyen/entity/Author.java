package com.ddtruyen.pracddtruyen.entity;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
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
@Table(name = "author")
public class Author {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id", columnDefinition = "int(11)")
  private Integer id;

  @Column(name = "name", columnDefinition = "nvarchar(255)")
  private String name;

  @Column(name = "avatar", columnDefinition = "nvarchar(255)")
  private String avatar;

  @Column(name = "address", columnDefinition = "nvarchar(255)")
  private String address;

  @Column(name = "describe_author", columnDefinition = "nvarchar(255)")
  private String describe_author;

  @ManyToMany(mappedBy = "linkAuthors")
  private List<Story> linkStories;
}
