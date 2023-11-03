package com.cos.Fruits.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.ColumnDefault;



import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Table(name = "product")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class Product extends BaseEntity{
	@Id
	@Column(nullable = false, length = 50)
	private int productId;
	
	@Column(nullable = false, length = 300)
	private String productName;
	
	@Column(nullable = false, length = 10)
	private int price;
	
	@ColumnDefault("0")
	@Column(nullable = false, length = 4)
	private int stock;
	
	@ColumnDefault("0")
	@Column(nullable = false)
	private int origin;  // 0 : 국산 / 1 : 수입산
	
	@ColumnDefault("0")
	@Column(nullable = false)
	private int season;  // 0 : 봄 / 1 : 여름 / 2: 가을 / 3: 겨울
	
	@ColumnDefault("0")
	@Column(nullable = true)
	private int recommend; // 0:기본 1~5까지
	
	@ColumnDefault("1")
	@Column(nullable = false)
	private int category; // 1 : 과일 , 2 : 과일을 이용한 상품	
	
	@Lob
	@Column(nullable = false)
	private String productDetail;
	
	@Column(nullable = false) 
	private String prodImgPath;
	
	@Column(nullable = false)
	private int prodStatus; // 0: 판매 / 1: 품절
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private User user;
	
}
