package com.cos.Fruits.service;



import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.Fruits.dto.OrderDto;
import com.cos.Fruits.model.Order;
import com.cos.Fruits.repository.OrderRepository;

@Service
public class OrderService {

	@Autowired
	private OrderRepository orderRepository;
	
	@Autowired
	private CartService cartService;
	
	@Transactional
	public void 주문(Order order) {
		orderRepository.save(order);
	}
	
	@Transactional(readOnly = true)
	public Page<Order> 주문목록(Pageable pageable) {
		return orderRepository.findAll(pageable);
	}
	
	@Transactional(readOnly = true)
	public List<Order> 주문목록() {
		return orderRepository.findAll();
	}
	
	public Order 주문보기(int id) {
		return orderRepository.findById(id).orElseThrow(()->{
			return new IllegalArgumentException("실패 : 아이디 없음");
		});
	}
	
	@Transactional(readOnly = true)
	public List<OrderDto> 주문목록(int id) {
		Order order = 주문보기(id);
		ArrayList<OrderDto> orderDtos = new ArrayList<>();
		String pdIds[] = order.getPdIds().split(",");
		String prices[] = order.getPrice().split(",");
		String pdNms[] = order.getPdNms().split(",");
		String qtys[] = order.getQty().split(",");
		for(int i = 0; i < pdIds.length; i++ ) {
			OrderDto orderDto = new OrderDto();
			orderDto.setAdress(order.getAdress());
			orderDto.setId(order.getId());
			orderDto.setTotalprice(order.getTotalprice());
			orderDto.setUser(order.getUser());
			orderDto.setOrderTitle(order.getOrderTitle());
			orderDto.setPrice(prices[i]);
			orderDto.setPdIds(pdIds[i]);
			orderDto.setPdNms(pdNms[i]);
			orderDto.setQty(qtys[i]);
			orderDto.setStatus(order.getStatus());
			orderDtos.add(orderDto);			
		}
		return orderDtos;
		
	}
	
	@Transactional
	public void 주문삭제(int id) {
		orderRepository.deleteById(id);
	}
	
	@Transactional
	public void 주문수정(int id, Order requestBoard) {
		Order order = orderRepository.findById(id).orElseThrow(()->{
			return new IllegalArgumentException("실패 : 아이디 없음");
		});
		order.setStatus(requestBoard.getStatus());
	}
}