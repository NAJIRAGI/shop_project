package com.cos.Fruits.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.cos.Fruits.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeSerivce;
	
	@GetMapping("/notice")
	public String index(Model model,@PageableDefault(size=5,sort="id",
	direction=Sort.Direction.DESC) Pageable pageable) {
		model.addAttribute("notice", noticeSerivce.글목록(pageable));
		
		return "notice/noticeList";
	}
	@GetMapping("/notice/{id}/noticeUpdateForm")
	public String updateForm(@PathVariable int id,Model model) {
		model.addAttribute("notice",noticeSerivce.글상세보기(id));
		
		return "notice/noticeUpdateForm";
	}
	@GetMapping({"/notice/noticeSaveForm"})
	public String saveForm() {
		
		return "notice/noticeSaveForm";
	}
	
	@GetMapping("/notice/{id}")
	public String findById(@PathVariable int id,Model model) {
		model.addAttribute("notice",noticeSerivce.글상세보기(id));
		
		return "notice/noticeDetail";
	}
}
