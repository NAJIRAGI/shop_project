package com.cos.Fruits.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.cos.Fruits.service.BoardService;
import com.cos.Fruits.service.ProductService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private ProductService productService;
	
	@GetMapping({"","/"})
	public String home(Model model, @PageableDefault(size = 10, sort = "productId",
	direction = Sort.Direction.DESC) Pageable pageable) {
		model.addAttribute("products", productService.상품목록(pageable));
		return "home";
	}	
	
	
	@GetMapping("/board")
	public String index(Model model,@PageableDefault(size=3,sort="id",
	direction=Sort.Direction.DESC) Pageable pageable) {
		model.addAttribute("boards",boardService.글목록(pageable));
		return "board/index";
	}
	
	@GetMapping("/board/{id}/updateForm")
	public String updateForm(@PathVariable int id,Model model) {
		model.addAttribute("board",boardService.글상세보기(id));
		return "board/updateForm";
	}
	
	@GetMapping({"/board/saveForm"})
	public String saveForm() {
		return "board/saveForm";
	}
	
	@GetMapping("/board/{id}")
	public String findById(@PathVariable int id,Model model) {
		model.addAttribute("board",boardService.글상세보기(id));
		
		return "board/detail";
	}
}
