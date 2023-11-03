package com.cos.Fruits.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.cos.Fruits.config.auth.PrincipalDetail;
import com.cos.Fruits.dto.ResponseDto;
import com.cos.Fruits.model.Notice;
import com.cos.Fruits.service.NoticeService;

@RestController
public class NoticeApiController {
	
	@Autowired
	private NoticeService noticeService;
	
	@PostMapping("api/notice")
	public ResponseDto<Integer> save(@RequestBody Notice notice,@AuthenticationPrincipal PrincipalDetail principal){
		noticeService.글쓰기(notice,principal.getUser());
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@DeleteMapping("/api/notice/{id}")
	public ResponseDto<Integer> deleteById(@PathVariable int id){
		System.out.println("board delete 호출");
		noticeService.글삭제하기(id);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@PutMapping("/api/notice/{id}")
	public ResponseDto<Integer> update(@PathVariable int id,@RequestBody Notice notice){
		noticeService.글수정하기(id,notice);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}

	
}
