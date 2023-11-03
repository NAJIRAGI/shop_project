package com.cos.Fruits.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.Fruits.model.Product;
import com.cos.Fruits.repository.ProductRepository;

@Service
public class ProductService {
	
	@Autowired
	private ProductRepository productRepository;
	
	@Transactional
	public void 상품등록(Product product) {	
		productRepository.save(product);
	}
	
	@Transactional(readOnly=true)
	public List<Product> 상품목록() {
		return productRepository.findAll();
	}
		
	@Transactional(readOnly=true)
	public Page<Product> 상품목록(Pageable pageable) {
		return productRepository.findAll(pageable);
	}
	
	@Transactional(readOnly=true)
	public Product 상세보기(int productId) {
		return productRepository.findById(productId).orElseThrow(()->{
			return new IllegalArgumentException("상세보기 실패 : 상품정보를 찾을 수 없습니다.");
		});
	}
	
	@Transactional
	public void 삭제하기(int productId) {
		productRepository.deleteById(productId);
	}
	
	@Transactional
	public void 수정하기(int productId, Product requestProduct) {
		Product product = productRepository.findById(productId).orElseThrow(() -> {
			return new IllegalArgumentException("상품 찾기 실패 : 상품정보를 찾을 수 없습니다.");
	});
	product.setProdStatus(requestProduct.getProdStatus());
	product.setProductDetail(requestProduct.getProductDetail());
	product.setProdImgPath(requestProduct.getProdImgPath());
	product.setProductName(requestProduct.getProductName());
	product.setOrigin(requestProduct.getOrigin());
	product.setSeason(requestProduct.getSeason());
	product.setPrice(requestProduct.getPrice());
	product.setStock(requestProduct.getStock());	
	}

}
