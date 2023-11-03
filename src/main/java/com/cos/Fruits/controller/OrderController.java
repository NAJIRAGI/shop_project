package com.cos.Fruits.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.cos.Fruits.service.OrderService;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;
	
	@GetMapping({"/user/orderlist"})
	public String orderlist(Model model, @PageableDefault(size = 5, sort="id",
	direction = Sort.Direction.ASC) Pageable pageable) {
		model.addAttribute("orders", orderService.주문목록(pageable));
		
		return "/user/orderlist";
	}
	
	@GetMapping({"/user/orderDetail/{id}"})
	public String orderDetail(@PathVariable int id, Model model) {
		model.addAttribute("orders", orderService.주문목록(id));		
		return "/user/orderDetail";
	}
	
}
