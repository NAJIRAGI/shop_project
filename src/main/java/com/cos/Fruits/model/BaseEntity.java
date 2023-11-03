package com.cos.Fruits.model;


import javax.persistence.Column;
import javax.persistence.EntityListeners;
import javax.persistence.MappedSuperclass;

import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@EntityListeners(value = {AuditingEntityListener.class})
@MappedSuperclass
@Getter
@NoArgsConstructor
@AllArgsConstructor
public abstract class BaseEntity extends BaseTiemEntity {

	@CreatedBy
	@Column(updatable = false)
	private String createdBy;
	
	@LastModifiedBy
	private String modifiedBy;
	
	
}
