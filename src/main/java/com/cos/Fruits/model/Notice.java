package com.cos.Fruits.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name="notice")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@SequenceGenerator(
		name = "USER_SEQ_GENERATOR8"
		, sequenceName="USER_SEQ8"
		, initialValue = 1
		, allocationSize = 1
	)
@Entity

public class Notice {
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="USER_SEQ_GENERATOR8")
	private int id;
	@Column(nullable=false, length=100)
	private String title;
	@Lob
	private String content;
	private int count;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="userId")
	private User users;
	
	@CreationTimestamp
	private Timestamp createDate;	
	
}


