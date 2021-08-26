package org.sob.mapper;

import org.apache.ibatis.annotations.Param;
import org.sob.domain.JoinVO;
import org.sob.domain.UserVO;

public interface LoginMapper {
	public UserVO getUserIdToGoogle(String googleId); // googleID로 userId 불러오기
	public UserVO getUserIdToEmail(@Param("email") String email, @Param("pw")String pw); // 시스템 로그인
	public void joinUser(JoinVO join); // 회원 가입
	public UserVO dupleCheck(String emailId); // email 중복 체크
	public void modifyForEmailUser(JoinVO join);
	public void modifyForGoogleUser(JoinVO join);
}
