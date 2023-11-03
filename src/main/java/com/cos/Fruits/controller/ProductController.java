package com.cos.Fruits.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.cos.Fruits.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	

	
	@GetMapping({"/admin/product/list"})
	public String list(Model model, @PageableDefault(size = 10, sort = "productId",
	direction = Sort.Direction.ASC) Pageable pageable) {
		model.addAttribute("products", productService.상품목록(pageable));
		return "admin/product/list";
	}
	
	@GetMapping({"/admin/adminForm"})
	public String adminForm() {
		return "admin/adminForm";
	}
	
	@GetMapping({"/admin/product/read/{productId}"})
	public String findById(@PathVariable int productId, Model model) {
		model.addAttribute("product", productService.상세보기(productId));
		return "admin/product/read";
	}
	
	@GetMapping("/admin/product/{productId}/update")
	public String update(@PathVariable int productId, Model model) {
		model.addAttribute("product",productService.상세보기(productId));
		return "admin/product/update";
	}
	
	@GetMapping({"insert"})
	public String insert() {
		return "/admin/product/insert";
	}
	
	/*@GetMapping({"","/"})
	public String index(Model model, @PageableDefault(size = 5, sort = "productId",
	direction = Sort.Direction.DESC) Pageable pageable) {
		model.addAttribute("products", productService.상품목록(pageable));
		return "index";
	}	
	*/
	
	
}
