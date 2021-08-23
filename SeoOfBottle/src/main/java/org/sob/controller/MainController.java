package org.sob.controller;

import org.sob.domain.MainVO;
import org.sob.domain.UserVO;
import org.sob.service.MainService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/sob/*")
@AllArgsConstructor

public class MainController {
	
	private MainService service;
	
	//목록
	@GetMapping("/main")//자기자신.jsp 페이지 오픈
	public void list(UserVO uvo, Model model) {
		log.info("목록페이지요청");
		model.addAttribute("list",service.getList(uvo.getUserId()));
		model.addAttribute("UserVO",uvo);
		
	}
	
	//등록
	@PostMapping("/register")//새유리병, 이어쓴 편지 등록
	public String register(MainVO mvo ) {
		//편지 등록 후 list페이지로 돌아감
		service.register(mvo); 
		
		return "redirect:/sob/main";//리다이렉트로 보냄//get형식으로 url에 값 실어서 보내기 가능
	}	
	
	@GetMapping("/register")//등록페이지 jsp 열기 groupid 추후 수정
	public void register() {
		
	}
	
	//상세
	@GetMapping("/get")
	public void get(String groupId, Model model) {
		log.info("유리병 보기 요청");
		model.addAttribute("latter",service.get(groupId));
		model.addAttribute("groupId",groupId);
			
	}
	
	//버리기
	@PostMapping("/remove")
	public String remove(String groupId) {
		log.info("유리병버리기 요청");
		service.remove(groupId);
		
		return "redirect:/sob/main";
	}
	
	
	
	
	

}
