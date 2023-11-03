package com.cos.Fruits.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.Fruits.model.Product;

public interface ProductRepository extends JpaRepository<Product, Integer> {
	
}
