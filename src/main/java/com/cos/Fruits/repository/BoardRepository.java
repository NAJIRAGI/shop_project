package com.cos.Fruits.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.Fruits.model.Boards;

public interface BoardRepository extends JpaRepository<Boards,Integer> {

}
