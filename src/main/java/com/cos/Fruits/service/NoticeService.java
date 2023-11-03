package com.cos.Fruits.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.Fruits.model.Notice;
import com.cos.Fruits.model.User;
import com.cos.Fruits.repository.NoticeRepository;

@Service
public class NoticeService {
	@Autowired
	private NoticeRepository noticeRepository;
	
	@Transactional
	public void 글쓰기(Notice notice, User user) {
		notice.setCount(0);
		notice.setUsers(user);
		
		noticeRepository.save(notice);
	}
	@Transactional(readOnly=true)
	public Page<Notice> 글목록(Pageable pageable){
		return noticeRepository.findAll(pageable);
	}
	@Transactional(readOnly=true)
	public Notice 글상세보기(int id) {
		return noticeRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("글 상세보기 실패 ");
				});
	}
	@Transactional
	public void 글삭제하기(int id) {
		noticeRepository.deleteById(id);
	}
	@Transactional
	public void 글수정하기(int id, Notice requestNotice) {
		Notice notice = noticeRepository.findById(id).orElseThrow(()->{
			return new IllegalArgumentException("글 찾기 실패");
		});
	notice.setTitle(requestNotice.getTitle());
	notice.setContent(requestNotice.getContent());
	}
}
