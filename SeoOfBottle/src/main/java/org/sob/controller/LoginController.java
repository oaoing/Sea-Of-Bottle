package org.sob.controller;

import java.util.Locale;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.sob.domain.JoinVO;
import org.sob.domain.UserVO;
import org.sob.service.LoginService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
public class LoginController {
	
	private LoginService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		return "index";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String list(HttpServletRequest httpServletRequest, HttpSession session, Model model) {
		// google login 후 결과 발송
		UserVO user = null;
		String email = httpServletRequest.getParameter("email");
		if (httpServletRequest.getParameter("google")!=null) {
			String googleid = httpServletRequest.getParameter("googleid");
			user = service.getUserIdToGoogle(googleid);
			if(user == null) {
				log.info("로그인 실패");
				model.addAttribute("email", email);
				
				String[] dupleCheck = service.dupleCheck(email).split("/");
				model.addAttribute("googleid", googleid);
				model.addAttribute("dupleCheck", dupleCheck[0]);
				if(dupleCheck.length > 1) {
					model.addAttribute("nick", dupleCheck[1]);
				}
				
				return "joinGoogle";
			}
		}else {
			String pw = httpServletRequest.getParameter("pw");
			if(pw.length() >= 8) {
				user = service.getUserIdToEmail(email, pw);
			}
			if(user == null) {
				log.info("로그인 실패");
				model.addAttribute("error", "아이디 또는 비밀번호를 잘못 입력하셨습니다.");
				return "index";
			}
		}
		
		
		log.info("로그인 성공");
		session.setAttribute("uvo", user);
		session.setMaxInactiveInterval(30*60);
		return "redirect:/sob/main";
	}
	
	@RequestMapping(value = "/join")
	public String join(Model model) {
		return "join";
	}
	
	@RequestMapping(value = "/joinGoogle")
	public String joinGoogle(Model model) {
		return "joinGoogle";
	}
	
	@RequestMapping(value = "/signUpInput", method = RequestMethod.POST)
	public String signUpInput(HttpServletRequest httpServletRequest) {
		JoinVO join = new JoinVO();
		join.setId(httpServletRequest.getParameter("email"));
		join.setPw(httpServletRequest.getParameter("pw"));
		join.setNick(httpServletRequest.getParameter("nick"));
		join.setGoogleid(httpServletRequest.getParameter("googleid"));
		
		service.joinUser(join);
		join = null;
		return "redirect:/";
	}
	
	@RequestMapping(value = "/modifyUser", method = RequestMethod.POST)
	public String modifyUser(HttpServletRequest httpServletRequest) {
		log.info("-----------수정 시작");
		JoinVO join = new JoinVO();
		join.setId(httpServletRequest.getParameter("email"));
		join.setPw(httpServletRequest.getParameter("pw"));
		join.setNick(httpServletRequest.getParameter("nick"));
		join.setGoogleid(httpServletRequest.getParameter("googleid"));
		
		if(join.getPw().equals("0")) {
			log.info("email 유저가 google 로그인 등록");
			service.modifyForEmailUser(join);
		}else {
			log.info("google 유저가 email 로그인 등록");
			service.modifyForGoogleUser(join);
		}
		join = null;
		log.info("------------수정 완료");
		return "redirect:/";
	}
	
	
	// REST API
	@GetMapping(value = "/confirmEmail", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> confirmEmail(@RequestParam(value = "email") String email) {
		log.info("----------중복 확인");
		return new ResponseEntity<String>(service.dupleCheck(email), HttpStatus.OK);
	}

	@GetMapping(value = "/requestAuthEmail", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> requestAuthEmail(@RequestParam(value = "email") String email,
			HttpServletRequest request){
		try {
			log.info("----------인증 메일 전송 시작");
			String authCode = service.sendMail(email);
//			HttpSession session = request.getSession();
//	        session.setAttribute("authCode", authCode);
//	        // 유지시간 2분
//	        session.setMaxInactiveInterval(60*2);

	        log.info("----------인증 메일 전송 완료");
			return new ResponseEntity<String>(authCode, HttpStatus.OK);
		}
		catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("failed", HttpStatus.OK);
		}
		
	}
	
}
