package com.cos.Fruits.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.cos.Fruits.dto.ResponseDto;
import com.cos.Fruits.model.User;
import com.cos.Fruits.repository.UserRepository;
import com.cos.Fruits.service.UserService;

@RestController
public class UserApiController {
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private UserService userService;
	@PostMapping("/auth/joinProc")
	public ResponseDto<Integer> save(@RequestBody User user){
		System.out.println("UserApiController호출됨");
		
//		person.setRoles(RoleType.USER);
		
		userService.회원가입(user);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	
	@PutMapping("/user")
	public ResponseDto<Integer> update(@RequestBody User user){
		
		userService.회원수정(user);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@PostMapping("/auth/findId")
	public ResponseDto<String> find(@RequestBody User user){
		
		
		User email= userService.회원찾기(user);
		return new ResponseDto<String>(HttpStatus.OK.value(),email.getUsername());

	}
	
	@PostMapping("/auth/findpwd")
	public ResponseDto<String> findpwd(@RequestBody User user,Model model) {
		User person = userRepository.findByUsername(user.getUsername())
				.orElseThrow(()->{
					return new IllegalArgumentException("글 상세보기 실패: 아이디를 찾을 수 없습니다.");
				});

			if(person.getEmail().equals(user.getEmail())){
//				System.out.println("111");
				if(person.getName().equals(user.getName())){
//					System.out.println("2222");
					if(person.getTel().equals(user.getTel())){
						
						person.setPassword(user.getPassword());
						userService.회원수정(person);
						return new ResponseDto<String>(person.getId(),"비밀번호를 재설정했습니다.");
					}
				}
			}
		
		return new ResponseDto<String>(500,"회원정보가 틀렸습니다.");
	}
	
	@DeleteMapping("/user/updateForm/{id}")
	public ResponseDto<Integer> deleteById(@PathVariable int id){
//		System.out.println("111");
		userService.회원탈퇴(id);
		return new ResponseDto<Integer> (HttpStatus.OK.value(),1);
	}
	

	
//	@PostMapping("/api/user/login")
//	public ResponseDto<Integer> login(@RequestBody person person,HttpSession session){
//		System.out.println("UserApiController :login 호출됨");
//		person principal= userService.로그인(person);
//		
//		if(principal !=null) {
//			session.setAttribute("principal", principal);
//		}
//		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
//	}
}
