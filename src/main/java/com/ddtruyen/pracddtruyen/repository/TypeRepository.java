package com.ddtruyen.pracddtruyen.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ddtruyen.pracddtruyen.entity.Type;

@Repository
public interface TypeRepository extends JpaRepository<Type, Integer> {
  
}
