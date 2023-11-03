package com.cos.Fruits.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Table(name="cart")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity

@SequenceGenerator(
		name = "CART_SEQ_GENERATOR"
		, sequenceName = "CART_SEQ"
		, initialValue = 1
		, allocationSize = 1
		)


public class Cart extends BaseEntity{
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="CART_SEQ_GENERATOR")
	private int cartId;
	
	@Column(nullable = false)
	private int count;
	
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "userId")
	User user;
		
	@OneToMany(mappedBy = "cart", fetch = FetchType.EAGER)
	private List<CartItem> cartItems;
	

}
