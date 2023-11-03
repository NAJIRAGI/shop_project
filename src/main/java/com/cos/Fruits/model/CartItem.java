package com.cos.Fruits.model;

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


@Table(name="cartItem")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity

@SequenceGenerator(
		name = "CARTITEM_SEQ_GENERATOR"
		, sequenceName = "CARTITEM_SEQ"
		, initialValue = 1
		, allocationSize = 1
		)

public class CartItem extends BaseEntity {
	
	@Id	
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="CARTITEM_SEQ_GENERATOR")
	private int cartItemId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "cartId")
	private Cart cart;
	
	@Column(nullable = false)
	private int count;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "productId")
	private Product product;
	
}
