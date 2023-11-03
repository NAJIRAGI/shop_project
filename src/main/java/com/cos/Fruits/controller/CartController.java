package com.cos.Fruits.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.cos.Fruits.config.auth.PrincipalDetail;
import com.cos.Fruits.model.User;
import com.cos.Fruits.service.CartService;
import com.cos.Fruits.service.ProductService;
import com.cos.Fruits.service.UserService;

@Controller
public class CartController {

	@Autowired
	private ProductService productService;

	@Autowired
	private UserService userService;

	@Autowired
	private CartService cartService;

	@GetMapping({ "/cart/{productId}/prodDetail" })
	public String oderDetail(@PathVariable int productId, Model model, @AuthenticationPrincipal PrincipalDetail principal) {
		model.addAttribute("product", productService.상세보기(productId));
		model.addAttribute("cartItems", cartService.카트상세보기(principal.getUser().getId()).getCartItems());
		return "cart/prodDetail";
	}

	@GetMapping({ "/cart/cartlist" })
	public String cartForm(Model model, @AuthenticationPrincipal PrincipalDetail principal) {
		model.addAttribute("cartItems", cartService.카트상세보기(principal.getUser().getCart().getCartId()).getCartItems());
		return "cart/cartlist";
	}

}
