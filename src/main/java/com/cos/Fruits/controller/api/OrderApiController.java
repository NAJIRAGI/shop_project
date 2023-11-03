package com.cos.Fruits.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.cos.Fruits.config.auth.PrincipalDetail;
import com.cos.Fruits.dto.ResponseDto;
import com.cos.Fruits.model.CartItem;
import com.cos.Fruits.model.Order;
import com.cos.Fruits.model.User;
import com.cos.Fruits.service.CartService;
import com.cos.Fruits.service.OrderService;

@RestController
public class OrderApiController {

	@Autowired
	private OrderService orderService;

	@Autowired
	private CartService cartService;

	@PostMapping("/api/order")
	public ResponseDto<Integer> addOrder(@RequestBody Order order,@AuthenticationPrincipal PrincipalDetail principal) {
		System.out.println("아이디:" + order.getPdIds());
		System.out.println(order.getQty());
		
		order.setUser(principal.getUser());
		order.setAdress(principal.getUser().getAddress());
		String TotalPrice = order.getTotalprice();
		System.out.println(TotalPrice);
		order.setTotalprice(TotalPrice.replaceAll("[^0-9]", ""));
		System.out.println(order.getTotalprice());
		String pdIds[] = order.getPdIds().split(",");
		for (int i = 0; i < pdIds.length; i++) {
			CartItem cartItem = cartService.카트아이템상세보기(Integer.parseInt(pdIds[i]));
			if(order.getPdNms() == null) {
				order.setOrderTitle(cartItem.getProduct().getProductName() + "등" + pdIds.length + "개");
				order.setPdNms(cartItem.getProduct().getProductName());
				order.setPrice(cartItem.getProduct().getPrice() + "");				
			} else {
				String pdNms = order.getPdNms();
				String price = order.getPrice();
				order.setPdNms(pdNms + "," + cartItem.getProduct().getProductName());
				order.setPrice(cartItem.getProduct().getPrice() + "");
			}
		}		
		System.out.println(order.getTotalprice());
		order.setStatus("주문완료");
		orderService.주문(order);
		for(int i = 0; i < pdIds.length; i++) {
			cartService.카트비우기(Integer.parseInt(pdIds[i]));
		}
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
		
	
	
	@DeleteMapping({"/api/order/{id}"})
	public ResponseDto<Integer> deleteById(@PathVariable int id) {
		orderService.주문삭제(id);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@PutMapping({"/api/order/{id}"})
	public ResponseDto<Integer> edit(@PathVariable int id, @RequestBody Order order) {
		orderService.주문수정(id, order);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}

}
