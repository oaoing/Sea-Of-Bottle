package org.sob.controller;

import org.sob.domain.MainVO;
import org.sob.domain.UserVO;
import org.sob.service.MainService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/sob/*")
@AllArgsConstructor

public class MainController {
	
	private MainService service;
	
	//목록 전제척으로 rttr기능 하는지 테스트완료.
	@GetMapping("/main")//자기자신.jsp 페이지 오픈 테스트 완료
	public void list(Model model,@SessionAttribute("uvo") UserVO uvo) {//, String userid 테스트용
		
		log.info("목록페이지요청"+uvo);
		model.addAttribute("list", service.getList(uvo.getCustomerno()));
		
	}
	
	//등록
	@PostMapping("/register")//새유리병, 이어쓴 편지 등록 확인 필요 (돌아가는지)//새로쓴 편지는 테스트완료
	public String register(@SessionAttribute("uvo") UserVO uvo, MainVO mvo) {
		//편지 등록 후 list페이지로 돌아감
		log.info("register페이지"+uvo+mvo);
		service.register(mvo); 
		
		return "redirect:/sob/main";//리다이렉트로 보냄
	}	
	
	@GetMapping("/register")//등록페이지 jsp 열기
	public void register(Model model) {
		model.addAttribute("categoryList",service.getCategoryList());
		log.info("register페이지요청");
		
	}
	
	//상세
	@GetMapping("/get")
	public void get(String groupId, Model model,@SessionAttribute("uvo") UserVO uvo) {//테스트 완료
		log.info("유리병 보기 요청"+groupId);
		model.addAttribute("latter",service.get(groupId));
		
		
	}
	
	//버리기
	@PostMapping("/remove")
	public String remove(String labelid ,@SessionAttribute("uvo") UserVO uvo) {//UserVO 테스트완료
		log.info("유리병버리기 요청"+labelid);
		
		log.info("유리병버리기 요청"+uvo);
		service.remove(labelid);
		
		return "redirect:/sob/main";
	}
	
	//자랑게시판
	@GetMapping("/boast")
	public void boast(Model model,@SessionAttribute("uvo") UserVO uvo) {//자랑하기 페이지
		log.info("자랑게시판 요청");
		model.addAttribute("boastList",service.getBoastList());
		
	}
	
	@GetMapping("/myboast")
	public void myboast(Model model,@SessionAttribute("uvo") UserVO uvo) {//자랑하기 페이지
		log.info("유리병 보기 요청");
		model.addAttribute("myList",service.getMyBoastList(uvo.getCustomerno()));
	}
	
	
	
	
	

}
