package com.cos.Fruits.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.cos.Fruits.model.Cart;
import com.cos.Fruits.model.RoleType;
import com.cos.Fruits.model.User;
import com.cos.Fruits.repository.CartRepository;
import com.cos.Fruits.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository; 
	
	@Autowired
	private CartRepository cartRepository;

	@Autowired
	private BCryptPasswordEncoder encodeer;
	
	@Transactional
	public void 회원가입(User user) {
		Cart cart = new Cart();				
		String rawPassword = user.getPassword();
		String encPassword = encodeer.encode(rawPassword);
		user.setPassword(encPassword);
		if (user.getUsername().equals("ADMIN")) {
			user.setRoles(RoleType.ADMIN);
		} else {
			user.setRoles(RoleType.USER);
		}
		cart.setUser(user);
		cartRepository.save(cart);		
		user.setCart(cart);
		userRepository.save(user);	
	}
	
	
	@Transactional
	public void 회원수정(User user) {
		User persistance=userRepository.findById(user.getId()).orElseThrow(() ->{
			return new IllegalArgumentException("회원 찾기 실패");
		});
		
		String rawPassword = user.getPassword();
		String encPassword = encodeer.encode(rawPassword);
		persistance.setPassword(encPassword);
		persistance.setEmail(user.getEmail());
		persistance.setAddress(user.getAddress());
		persistance.setTel(user.getTel());
	}
	
	
	@Transactional
	public User 회원찾기(User user) {
		System.out.println(user.getEmail());
		User persistance=userRepository.findByEmail(user.getEmail())
				.orElseThrow(() ->{
					return new IllegalArgumentException("회원 찾기 실패");
		});
		return persistance;

	}

	
	@Transactional
	public void 회원탈퇴(int id) {
		userRepository.deleteById(id);
	}
	
	
	public User findUser(int id) {
		return userRepository.findById(id).get();
	}
	
}
