package com.cos.Fruits.model;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.EntityListeners;
import javax.persistence.MappedSuperclass;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@EntityListeners(value = {AuditingEntityListener.class})
@MappedSuperclass
@Data
@NoArgsConstructor
@AllArgsConstructor
public abstract class BaseTiemEntity {
	
	@CreatedDate
	@Column(updatable = false)
	private LocalDateTime regTime;
	
	@LastModifiedDate
	private LocalDateTime updateTime;
}
