package com.cos.Fruits.model;

import javax.annotation.Generated;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Table(name = "orders")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity

@SequenceGenerator(
		name = "ORDER_SEQ_GENERATOR"
		, sequenceName = "ORDER_SEQ"
		, initialValue = 1
		, allocationSize = 1
		)
public class Order extends BaseEntity{
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ORDER_SEQ_GENERATOR")
	private int id;
	
	@Column(length = 100)
	private String price;
	
	@Column(length = 100)
	private String totalprice;
	
	@Column(length = 100)
	private String orderTitle;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "userId")
	private User user;
	
	@Column(nullable = false, length = 50)
	private String adress;
	
	@Column(length = 300)
	private String pdIds;
	
	@Column(length = 300)
	private String pdNms;
	
	@Column(length = 200)
	private String qty;
	
	@Column(length = 50)
	private String status;
	
	@Column(length = 100)
	private String payment;

}
