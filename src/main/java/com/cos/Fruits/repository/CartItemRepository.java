package com.cos.Fruits.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.Fruits.model.CartItem;


public interface CartItemRepository extends JpaRepository<CartItem, Integer> {
	
	/*@Query(value="FROM cartItem ci WHERE ci.productId = :productId and ci.cartId = :cartId", nativeQuery=true)
	CartItem findByCartIdAndProductId(@Param("productId") int cartId, @Param("cartId") int productId);*/
}
