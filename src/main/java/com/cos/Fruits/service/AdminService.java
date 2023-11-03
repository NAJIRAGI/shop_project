package com.cos.Fruits.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.Fruits.model.Boards;
import com.cos.Fruits.model.User;
import com.cos.Fruits.repository.UserRepository;

@Service
public class AdminService {
	
	@Autowired
	private UserRepository userRepository;
	
	@Transactional(readOnly=true)
	public Page<User> 회원목록(Pageable pageable) {
		return userRepository.findAll(pageable);
	}
	
	@Transactional(readOnly=true)
	public User 회원보기(int id) {
		return userRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("상세보기 실패 | 아이디를 찾을 수 없습니다.");
				});
	}
}
