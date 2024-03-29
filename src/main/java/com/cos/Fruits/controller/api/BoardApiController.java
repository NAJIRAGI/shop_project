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
import com.cos.Fruits.model.Boards;
import com.cos.Fruits.model.Reply;
import com.cos.Fruits.service.BoardService;

@RestController
public class BoardApiController {
	@Autowired
	private BoardService boardService;

	@PostMapping("api/board")
	public ResponseDto<Integer> save(@RequestBody Boards board,@AuthenticationPrincipal PrincipalDetail principal){
		boardService.글쓰기(board,principal.getUser());
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@DeleteMapping("/api/board/{id}")
	public ResponseDto<Integer> deleteById(@PathVariable int id){
		System.out.println("board delete 호출");
		boardService.글삭제하기(id);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@PutMapping("/api/board/{id}")
	public ResponseDto<Integer> update(@PathVariable int id,@RequestBody Boards board){
		boardService.글수정하기(id,board);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}

	@PostMapping("api/board/{boardId}/reply")
	public ResponseDto<Integer> replySave(@PathVariable int boardId, @RequestBody Reply reply,@AuthenticationPrincipal PrincipalDetail principal){
		
//		reply.setUsers(principal.getUser());
//		reply.setBoards(board);
		
		boardService.댓글쓰기(principal.getUser(),boardId,reply);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	

}
