package com.cos.Fruits.controller.api;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.cos.Fruits.config.auth.PrincipalDetail;
import com.cos.Fruits.dto.ResponseDto;
import com.cos.Fruits.model.CartItem;
import com.cos.Fruits.model.Order;
import com.cos.Fruits.service.CartService;
import com.cos.Fruits.service.ProductService;
import com.cos.Fruits.service.UserService;

@RestController
public class CartApiController {

	@Autowired
	private CartService cartService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProductService productService;
	
	@PostMapping("/api/board/orderDetail/{id}")
	public ResponseDto<Integer> addCart(@PathVariable int id, @RequestBody CartItem cartItem, @AuthenticationPrincipal PrincipalDetail principal) {
		cartService.카트담기(id, principal, cartItem);		
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@DeleteMapping("/api/order/deleteById")
	public ResponseDto<Integer> deleteById(@RequestBody Order order){
		String PdIds[] = order.getPdIds().split(",");
		for(int i =0;i < PdIds.length;i++) {
			cartService.카트비우기(Integer.parseInt(PdIds[i]));
		}
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@DeleteMapping("/api/order/deleteAll")
	public ResponseDto<Integer> deleteAll(@RequestBody Order order){
		String PdIds[] = order.getPdIds().split(",");
		for(int i =0;i < PdIds.length;i++) {
			cartService.카트비우기(Integer.parseInt(PdIds[i]));
		}
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	
}
