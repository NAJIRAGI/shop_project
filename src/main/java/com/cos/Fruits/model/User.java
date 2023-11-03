package com.cos.Fruits.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
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

@SequenceGenerator(
		name="USER_SEQ_GENERATOR",
		sequenceName="USER_SEQ",
		initialValue=1,
		allocationSize=1
		)
@Table(name="users")	
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity

public class User extends BaseEntity{
@Id
@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="USER_SEQ_GENERATOR")
private  int id;

@Column(nullable=false,length=30,unique=true)
private String username;

@Column(nullable=false,length=100)
private String password;

@Column(nullable=false,length=50,unique=true)
private String email;

@Column(nullable=false)
private int money;

@Enumerated(EnumType.STRING)
private RoleType roles;

@OneToOne(mappedBy = "user",fetch = FetchType.EAGER)
@JoinColumn(name = "cartId")
private Cart cart;

@Column(nullable=false,length=100)
private String address;

@Column(nullable=false,length=100)
private String tel;

@Column(nullable=false,length=100)
private String name;
}
