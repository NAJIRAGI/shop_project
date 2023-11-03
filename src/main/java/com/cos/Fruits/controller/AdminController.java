package com.cos.Fruits.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.cos.Fruits.config.auth.PrincipalDetail;
import com.cos.Fruits.model.RoleType;
import com.cos.Fruits.service.AdminService;
import com.cos.Fruits.service.OrderService;
import com.cos.Fruits.service.UserService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping({"/admin/userList"})
	public String userList(Model model,@PageableDefault(size = 5, sort = "id", 
	direction = Sort.Direction.DESC) Pageable pagable) {
		model.addAttribute("users", adminService.회원목록(pagable));
		return "/admin/userList";
	}
	
	@GetMapping({"/admin/userUpdate/{id}"})
	public String userUpdate(@PathVariable int id, Model model) {
		model.addAttribute("user", adminService.회원보기(id));
		return "/admin/userUpdate";
	}
	
	@GetMapping({"/admin/adorderlist"})
	public String orderCheck(Model model, @PageableDefault(size = 5, sort = "id", direction = Sort.Direction.ASC) Pageable pageable, @AuthenticationPrincipal PrincipalDetail principal) {
		if(principal.getUser().getRoles() == RoleType.ADMIN) {
			model.addAttribute("orders", orderService.주문목록(pageable));
			return "/admin/adorderlist";
		} else {
			return "home";
		}
	}	
	
	@GetMapping({"/admin/adorderDetail/{id}"})
	public String adOrderDetail(@PathVariable int id, Model model, @AuthenticationPrincipal PrincipalDetail principal) {
		if(principal.getUser().getRoles() == RoleType.ADMIN) {
			model.addAttribute("orders",orderService.주문목록(id));
			return "/admin/adorderDetail";			
		}else {
			return "home";
		}
	}
	
	
}
