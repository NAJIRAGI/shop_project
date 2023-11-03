package com.cos.Fruits.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.Fruits.model.Boards;
import com.cos.Fruits.model.Reply;
import com.cos.Fruits.model.User;
import com.cos.Fruits.repository.BoardRepository;
import com.cos.Fruits.repository.ReplyRepository;

@Service
public class BoardService {

	@Autowired
	private BoardRepository boardRepository;
	
	@Autowired
	private ReplyRepository replyRepository;
	
	@Transactional
	public void 글쓰기(Boards board, User user) {
		board.setCount(0);
		board.setUsers(user);
		boardRepository.save(board);
	}
	
	@Transactional(readOnly=true)
	public Page<Boards> 글목록(Pageable pageable){
		return boardRepository.findAll(pageable);
	}
	@Transactional(readOnly=true)
	public Boards 글상세보기(int id) {
		return boardRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("글 상세보기 실패 | 아이디를 찾을 수 없습니다.");
				});
	}
	@Transactional
	public void 글삭제하기(int id) {
		boardRepository.deleteById(id);
	}
	@Transactional
	public void 글수정하기(int id, Boards requestBoard) {
		Boards board = boardRepository.findById(id).orElseThrow(()->{
			return new IllegalArgumentException("글 찾기 실패 | 아이디를 찾을 수 없습니다.");
		});
	board.setTitle(requestBoard.getTitle());
	board.setContent(requestBoard.getContent());
	}
	
	@Transactional
	public void 댓글쓰기(User user,int boardId,Reply requestReply) {
		Boards board = boardRepository.findById(boardId).orElseThrow(()->{
			return new IllegalArgumentException("댓글 쓰기 실패 | 게시굴 id를 찾을 수 없습니다.");
		});
	
		requestReply.setUsers(user);
		requestReply.setBoards(board);
		
		replyRepository.save(requestReply);
	}
	
	
}
