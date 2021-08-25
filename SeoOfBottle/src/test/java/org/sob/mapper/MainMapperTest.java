package org.sob.mapper;

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
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")//스프링 관련 설정 위치 지정
public class MainMapperTest {
	@Autowired
	private MainMapper mapper;
	
	@Test
	public void testGetList() {//내가 받은 유리병 목록 출력
		int userId = 1;
		mapper.getList(userId).forEach(main->log.info(main));
		
	}
	
	@Test
	public void testInsert() {//등록 
		MainVO mvo = new MainVO();
		mvo.setCategoryId(1);
		mvo.setBoast("false");
		mvo.setCnt(1);
		mvo.setContents("내용내용내용");
		mvo.setFrom(1);
		mvo.setTo(2);
		mvo.setGroupId("newgroup");
		
		mapper.insert(mvo);
		
		
	}
	
	@Test
	public void testRead() {//유리병 하나 목록 받아오기
		String groupId = "groupid1";
		mapper.read(groupId).forEach(main->log.info(main));
	}
	
	@Test
	public void testDelete() {
		String groupId = "groupid2";
		mapper.delete(groupId);
	}
	
	@Test
	public void testgetBoastList() {
		
		mapper.getBoastList().forEach(main->log.info(main));
		
		
	}
	
	@Test
	public void getMyBoastList() {
		int cno = 1;
		mapper.getMyBoastList(cno).forEach(main->log.info(main));
		
	}
	
	
	
	
}
