package org.sob.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.sob.domain.MainVO;
import org.sob.domain.ReplyVO;
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
	public void testregister() {//상세
		MainVO mvo = new MainVO();
		mvo.setBoast(1);
		mvo.setCategoryid(1);
		mvo.setCnt(1);
		mvo.setContents("gkgkgkg");
		mvo.setFrom(2);
		mvo.setTo(3);
		
		service.register(mvo);;
		
	}
	
	
	@Test
	public void testGet() {//상세
		String groupId = "그룹아이디";
		service.get(groupId).forEach(mvo->log.info(mvo));
		
	}
	
	
	@Test
	public void testRemove() {//삭제
		String groupId = "groupidid";
		service.remove(groupId);
		
	}
	
	@Test
	public void testGetList() {//전체리스트
		
		
		
		
		
	}
	
	@Test
	public void testgetBoastList() {
//		service.getBoastList();
		
	}
	
	@Test
	public void testgetMyBoastList() {
		int cno = 2;
//		service.getMyBoastList(cno);s
		
	}
	
	
	
}
