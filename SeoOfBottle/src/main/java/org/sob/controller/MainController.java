package org.sob.controller;

import java.util.List;

import org.sob.domain.Criteria;
import org.sob.domain.MainVO;
import org.sob.domain.PageDTO;
import org.sob.domain.UserVO;
import org.sob.service.MainService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/sob/*")
@AllArgsConstructor

public class MainController {
	
	private MainService service;
	
	//내 목록 불러오기
	@GetMapping("/main")//자기자신.jsp 페이지 오픈 테스트 완료
	public void list(Model model,@SessionAttribute("uvo") UserVO uvo, Criteria cri) {
		if(cri.getCategoryid()==0) {
			log.info("목록페이지요청"+cri);
			cri.setCustomerno(uvo.getCustomerno());
			log.info("목록페이지요청"+cri);
			model.addAttribute("categoryList",service.getCategoryList());
			model.addAttribute("pageMaker",new PageDTO(cri,service.getTotal(cri)));
			log.info("목록페이지요청"+new PageDTO(cri,service.getTotal(cri)));
			model.addAttribute("list", service.getList(cri));
			log.info("list"+service.getList(cri));
		} else {
			log.info("목록페이지카테고리로요청"+uvo);
			cri.setCustomerno(uvo.getCustomerno());
			model.addAttribute("categoryList",service.getCategoryList());
			model.addAttribute("pageMaker",new PageDTO(cri,service.getListUseCategoryTotal(cri)));
			log.info("목록페이지요청"+new PageDTO(cri,service.getListUseCategoryTotal(cri)));
			model.addAttribute("list", service.getListUseCategory(cri));
			log.info("목록페이지요청"+service.getListUseCategory(cri));
		}
	}

	//등록
	@PostMapping("/register")//새유리병, 이어쓴 편지 등록 확인 필요 (돌아가는지)//새로쓴 편지는 테스트완료
	public String register(@SessionAttribute("uvo") UserVO uvo, MainVO mvo) {
		//편지 등록 후 list페이지로 돌아감
		log.info("register페이지"+uvo+mvo);
		if(mvo.getLabelid()==0) {//처음생성일때와 추가글일때 나누는 기능
			service.register(mvo); 
		} else if(mvo.getCnt()==4 ){
			service.updateBoast(mvo);
		} else {
			service.registerAdd(mvo);
		}
		
		
		return "redirect:/sob/main";//리다이렉트로 보냄
	}	
	
	@GetMapping("/register")//새글등록페이지 jsp 열기
	public void register(Model model) {
		model.addAttribute("categoryList",service.getCategoryList());
		log.info("register페이지요청");
		
	}
	
	//상세
	@GetMapping("/get")
	public void get(String labelid, Model model) {//테스트 완료
		log.info("유리병 보기 요청"+labelid);
		List<MainVO> mvoList = service.get(labelid);
		MainVO mvo = new MainVO();
		for(MainVO temp: mvoList ) {
			mvo.setCnt(temp.getCnt()); 
		}
		int lastread = service.readLast(labelid);
		mvo.setTo(lastread);
		
		model.addAttribute("latter",mvoList);
		model.addAttribute("mvo",mvo);
		
	}
	
	//버리기
	@PostMapping("/remove")
	public String remove(MainVO mvo ,@SessionAttribute("uvo") UserVO uvo) {//UserVO 테스트완료
		log.info("유리병버리기 요청"+mvo.getLabelid());
		log.info("유리병버리기 요청"+uvo);
		if(mvo.getFrom()==uvo.getCustomerno()) {
			service.remove(""+mvo.getLabelid());
		} else {
			mvo.setFrom(uvo.getCustomerno());
			service.remove2(mvo);//컨트롤러에서 서비스로 던지는 객체는 하나여야한다.
		}
		return "redirect:/sob/main";
	}
	
	//자랑게시판
	@GetMapping("/boast")
	public void boast(Model model,@SessionAttribute("uvo") UserVO uvo, Criteria cri) {//자랑하기 페이지
		log.info("자랑게시판 요청");
		if(cri.getCategoryid()==0) {
			cri.setCustomerno(uvo.getCustomerno());
			log.info("목록페이지요청"+cri);
			model.addAttribute("categoryList",service.getCategoryList());
			model.addAttribute("pageMaker",new PageDTO(cri,service.getBoastListTotal(cri)));
			model.addAttribute("boastList", service.getBoastList(cri));
		} else {
			cri.setCustomerno(uvo.getCustomerno());
			log.info("목록페이지요청"+cri);
			model.addAttribute("categoryList",service.getCategoryList());
			model.addAttribute("pageMaker",new PageDTO(cri,service.getBoastListUseCategoryTotal(cri)));
			log.info("목록페이지요청"+new PageDTO(cri,service.getBoastListUseCategoryTotal(cri)));
			model.addAttribute("boastList", service.getBoastListUseCategory(cri));
		}
		
	}

	@GetMapping("/myboast")
	public void myboast(Model model,@SessionAttribute("uvo") UserVO uvo, Criteria cri, String replyPage) {//자랑하기 페이지
		log.info("내 자랑 보기 요청");
		if(cri.getCategoryid()==0) {
			cri.setCustomerno(uvo.getCustomerno());
			log.info("목록페이지요청"+cri);
			model.addAttribute("categoryList",service.getCategoryList());
			model.addAttribute("pageMaker",new PageDTO(cri,service.getMyBoastListTotal(cri)));
			log.info("목록페이지요청"+new PageDTO(cri,service.getMyBoastListTotal(cri)));//수정예정
			model.addAttribute("myList", service.getMyBoastList(cri));
			log.info("myList"+service.getMyBoastList(cri));
			model.addAttribute("replyPage", (replyPage==null)?1:replyPage);
		} else {
			cri.setCustomerno(uvo.getCustomerno());
			log.info("목록페이지요청"+cri);
			model.addAttribute("categoryList",service.getCategoryList());
			model.addAttribute("pageMaker",new PageDTO(cri,service.getMyBoastListUseCategoryTotal(cri)));
			log.info("목록페이지요청"+new PageDTO(cri,service.getMyBoastListUseCategoryTotal(cri)));
			model.addAttribute("myList", service.getMyBoastListUseCategory(cri));
			log.info("myList"+service.getMyBoastListUseCategory(cri));
			model.addAttribute("replyPage", (replyPage==null)?1:replyPage);
		}
		
	}
	
	//자랑상세
	@GetMapping("/boastdetail")
	public void boastdetail(String labelid, Model model) {//테스트 완료
		log.info("자랑상세 보기 요청"+labelid);
		List<MainVO> mvoList = service.get(labelid);
		model.addAttribute("latter",mvoList);
	}
	

}
