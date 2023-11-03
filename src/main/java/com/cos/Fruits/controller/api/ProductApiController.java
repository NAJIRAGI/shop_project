package com.cos.Fruits.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.cos.Fruits.dto.ResponseDto;
import com.cos.Fruits.model.Product;
import com.cos.Fruits.service.ProductService;

@RestController
public class ProductApiController {
	
	@Autowired
	private ProductService productService;
	
	@PostMapping("/api/insert")
	public ResponseDto<Integer> insert(@RequestBody Product product) {		
		productService.상품등록(product);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}	
	
	@PutMapping("/api/admin/product/read/{productId}")
	public ResponseDto<Integer> modify(@PathVariable int productId, @RequestBody Product product) {
		System.out.println("받아옴" + product.getProdImgPath());
		System.out.println("받아옴" + product.getProductDetail());
		System.out.println("받아옴" + product.getProdStatus());
		productService.수정하기(productId, product);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@DeleteMapping("/api/admin/product/read/{productId}")
	public ResponseDto<Integer> deleteById(@PathVariable int productId){
		System.out.println("받아옴"+productId);
		productService.삭제하기(productId);
		
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}

}
