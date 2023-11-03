package com.cos.Fruits.dto;

import com.cos.Fruits.model.BaseEntity;
import com.cos.Fruits.model.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OrderDto extends BaseEntity {

	private int id;
	private String price;
	private String totalprice;
	private String orderTitle;
	private User user;
	private String adress;
	private String pdIds;
	private String pdNms;
	private String qty;
	private String status;
	private String payment;
}
