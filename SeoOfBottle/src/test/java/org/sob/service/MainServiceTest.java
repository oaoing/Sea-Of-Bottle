package org.sob.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.sob.domain.MainVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)//j유닛 사용할때 스프링을 사용하겠다.
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MainServiceTest {

	@Autowired
	private MainService service;
	
	@Test
	public void testRegister() {//등록
		MainVO mvo = new MainVO();
		mvo.setContents("새로 작성하는 내용1");
		mvo.setBoast("false");
		mvo.setCategoryId(1);
		mvo.setCnt(1);
		mvo.setFrom("tlstmdrbs");
		mvo.setTo("snrnsk");
		mvo.setGroupId("그룹아이디");
		
		service.register(mvo);
		
		
	}
	
	
	
	
}
