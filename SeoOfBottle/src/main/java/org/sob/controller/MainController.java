package org.sob.controller;

import org.sob.domain.MainVO;
import org.sob.domain.UserVO;
import org.sob.service.MainService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/sob/*")
@AllArgsConstructor

public class MainController {
	
	private MainService service;
	
	//목록 전제척으로 rttr기능 하는지 테스트가 필요함.(객체 히든 저장이 필요한가)
	@GetMapping("/main")//자기자신.jsp 페이지 오픈
	public void list(UserVO uvo, Model model) {//, String userid 테스트용
		log.info("목록페이지요청");
//		int user = Integer.parseInt(userid);//테스트용
//		model.addAttribute("list",service.getList(user));
//		model.addAttribute("UserVO",uvo);
		model.addAttribute("list",service.getList(uvo.getUserId()));
		model.addAttribute("UserVO",uvo);
		
	}
	
	//등록
	@PostMapping("/register")//새유리병, 이어쓴 편지 등록 확인 필요 (돌아가는지)
	public String register(UserVO uvo,RedirectAttributes rttr, MainVO mvo) {
		//편지 등록 후 list페이지로 돌아감
		
		service.register(mvo); 
		rttr.addFlashAttribute("uvo",uvo);
		return "redirect:/sob/main?";//리다이렉트로 보냄//get형식으로 url에 값 실어서 보내기 가능
	}	
	
	@GetMapping("/register")//등록페이지 jsp 열기 groupid 추후 수정
	public void register(Model model,UserVO uvo) {
		model.addAttribute("UserVO",uvo);
	}
	
	//상세
	@GetMapping("/get")
	public void get(String groupId, Model model,UserVO uvo) {
		log.info("유리병 보기 요청");
		model.addAttribute("latter",service.get(groupId));
		model.addAttribute("groupId",groupId);
		model.addAttribute("UserVO",uvo);
		
	}
	
	//버리기
	@PostMapping("/remove")
	public String remove(String groupId,UserVO uvo,RedirectAttributes rttr) {
		log.info("유리병버리기 요청");
		service.remove(groupId);
		rttr.addFlashAttribute("uvo",uvo);
		return "redirect:/sob/main?";
	}
	
	
	
	
	

}
