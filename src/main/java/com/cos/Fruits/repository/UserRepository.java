package com.cos.Fruits.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cos.Fruits.model.User;

@Repository
public interface UserRepository extends JpaRepository<User,Integer>{
//person findByUsernameAndPassword(String username,String password);
	Optional<User> findByUsername(String name);

	Optional<User> findByEmail(String email);
	
	Optional<User> findByEmailAndUsername(String email, String name);

}
