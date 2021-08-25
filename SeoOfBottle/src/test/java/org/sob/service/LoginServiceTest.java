package org.sob.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.sob.domain.JoinVO;
import org.sob.domain.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)//j유닛 사용할때 스프링을 사용하겠다.
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")

public class LoginServiceTest {
	@Autowired
	private LoginService service;
	
	@Test
	public void testGoogle() {	// 작동 확인 (O)
		
		UserVO user = service.getUserIdToGoogle("117915959124919370969");
		log.info(user.getCno());
		log.info(user.getGoogleid());
		log.info(user.getNick());
		
	}
	
	@Test
	public void testLogin() {	// 작동 확인 (O)
		
		UserVO user = service.getUserIdToEmail("fesfdf", "12341234");
		log.info(user.getCno());
		log.info(user.getGoogleid());
		log.info(user.getNick());
		
	}
	
	@Test
	public void testJoin() {	// 작동 확인 (O)
		JoinVO join = new JoinVO();
		join.setId("asdsagdsg");
		join.setPw("12341234");
		join.setNick("테스트");
		join.setGoogleid(null);
		service.joinUser(join);
	}
	
	@Test
	public void testDuple() {		// 작동 확인 (O)
		String check = service.dupleCheck("polkmn1024@gmail.com");	// 중복 이메일
		System.out.println(check);
		
		check = service.dupleCheck("oaoing2@gmail.com");	// 중복아닌 이메일
		System.out.println(check);
	}
	
	@Test
	public void testSendMail() {	// 작동 확인 (O)
		service.sendMail("polkmn35@naver.com");
	}
	
}
