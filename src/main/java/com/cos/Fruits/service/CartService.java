package com.cos.Fruits.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.Fruits.config.auth.PrincipalDetail;
import com.cos.Fruits.model.Cart;
import com.cos.Fruits.model.CartItem;
import com.cos.Fruits.model.User;
import com.cos.Fruits.repository.CartItemRepository;
import com.cos.Fruits.repository.CartRepository;
import com.cos.Fruits.repository.UserRepository;

@Service
public class CartService {

	@Autowired
	private CartRepository cartRepository;

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private ProductService productService;

	@Autowired
	private CartItemRepository cartItemRepository;

	// @Autowired
	// private UserRepository userRespositoRepository;

	@Transactional
	public void 카트담기(int id, PrincipalDetail principal, CartItem count) {
		CartItem cartItem = new CartItem();
		cartItem.setProduct(productService.상세보기(id));
		cartItem.setCart(principal.getUser().getCart());
		cartItem.setCount(count.getCount());

		cartItemRepository.save(cartItem);
	}

	@Transactional(readOnly = true)
	public List<CartItem> 카트보기() {
		return cartItemRepository.findAll();
	}

	@Transactional(readOnly = true)
	public Page<CartItem> 카트보기(Pageable pageable) {
		return cartItemRepository.findAll(pageable);
	}

	@Transactional(readOnly = true)
	public Cart 카트상세보기(int id) {
		return cartRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("실패: 아이디를 못 찾음");
		});
	}

	@Transactional(readOnly = true)
	public CartItem 카트아이템상세보기(int id) {
		return cartItemRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("실패: 아이디를 못 찾음");
		});
	}
	
	@Transactional
	public void 카트비우기(int id) {
		cartItemRepository.deleteById(id);
	}	

	@Transactional
	public void 카트구매(int id) {
		List<CartItem> cartItems = cartItemRepository.findAll();
		List<CartItem> userCartItems = new ArrayList<>();
		User buyer = userRepository.findById(id).get();
		
		for(CartItem cartItem : cartItems) {
			if(cartItem.getCart().getUser().getId() == buyer.getId()) {
				userCartItems.add(cartItem);
			}
		}
		
		for(CartItem cartItem : userCartItems) {
			int stock = cartItem.getProduct().getStock();
			
			stock = stock - cartItem.getCount();
			
			cartItem.getProduct().setStock(stock);
			
			User seller = cartItem.getProduct().getUser();
			int cash = cartItem.getProduct().getPrice();
			buyer.setMoney(cash * -1);
			seller.setMoney(cash);
		}
	}

}
