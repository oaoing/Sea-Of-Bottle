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

/**
 * Handles requests for the application home page.
 */
@Log4j
@Controller
@AllArgsConstructor
public class LoginController {
	
	private LoginService service;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
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
			String googleId = httpServletRequest.getParameter("googleId");
			user = service.getUserIdToGoogle(googleId);
			if(user == null) {
				log.info("로그인 실패");
				model.addAttribute("email", email);
				model.addAttribute("googleId", googleId);
				model.addAttribute("dupleCheck", service.dupleCheck(email));
				return "joinGoogle";
			}
		}else {
			user = service.getUserIdToEmail(email, httpServletRequest.getParameter("pw"));
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
		join.setId((String) httpServletRequest.getAttribute("email"));
		join.setPw((String) httpServletRequest.getAttribute("pw"));
		join.setNick((String) httpServletRequest.getAttribute("nick"));
		join.setGoogleid((String) httpServletRequest.getAttribute("googleId"));
		service.joinUser(join);
		return "redirect:/login";
	}
	
	@GetMapping(value = "/confirmEmail", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> confirmEmail(@RequestParam(value = "email") String email) {
		log.info("----------중복 확인");
		return new ResponseEntity<String>(service.dupleCheck(email), HttpStatus.OK);
	}

	@GetMapping(value = "/requestAuthEmail", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> requestAuthEmail(@RequestParam(value = "email") String email){
		log.info("----------인증 메일 전송 시작");
		String authCode = service.sendMail(email);
		
		
		return new ResponseEntity<String>(authCode, HttpStatus.OK);
	}
	
}
