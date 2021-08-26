package org.sob.service;

import org.sob.domain.JoinVO;
import org.sob.domain.UserVO;

public interface LoginService {
	public UserVO getUserIdToGoogle(String googleId); // googleID로 userId 불러오기

	public UserVO getUserIdToEmail(String email, String pw);	// 시스템 로그인
	
	public void joinUser(JoinVO join);	// 회원 가입
	
	public String dupleCheck(String emailId); // email 중복확인
	
	public String sendMail(String email); // 인증메일 전송

	public void modifyUser(JoinVO join); // 유저 수정
}
