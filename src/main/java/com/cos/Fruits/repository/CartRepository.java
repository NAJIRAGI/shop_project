package com.cos.Fruits.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.Fruits.model.Cart;

public interface CartRepository extends JpaRepository<Cart, Integer> {
	Cart findByUserId(int userId);

}
