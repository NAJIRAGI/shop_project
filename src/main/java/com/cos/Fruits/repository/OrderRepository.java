package com.cos.Fruits.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.Fruits.model.Order;

public interface OrderRepository extends JpaRepository<Order, Integer> {

}
