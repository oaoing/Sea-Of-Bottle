package org.sob.service;

import org.sob.domain.JoinVO;
import org.sob.domain.UserVO;
import org.sob.mapper.LoginMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class LoginServiceImpl implements LoginService {
	
	private LoginMapper mapper;
	
	@Override
	public UserVO getUserIdToGoogle(String googleId) {
		log.info("googleId --- 변환 중 ---> userId");
		return mapper.getUserIdToGoogle(googleId);
	}
	
	@Override
	public UserVO getUserIdToEmail(String email, String pw) {
		// TODO Auto-generated method stub
		return mapper.getUserIdToEmail(email, pw);
	}
	
	@Override
	public void joinUser(JoinVO join) {
		mapper.joinUser(join);
	}
	
	@Override
	public String dupleCheck(String emailId) {
		if (mapper.dupleCheck(emailId) != null) {
			return "unuseable";
		}else {
			return "useable";
		}
	}
}
