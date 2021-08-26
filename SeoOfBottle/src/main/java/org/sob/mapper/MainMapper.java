package org.sob.mapper;

import java.util.List;

import org.sob.domain.MainVO;
import org.sob.domain.ReplyVO;

public interface MainMapper {
	public List<MainVO> getList(int customerNo); //내가 받은 모든 유리병 목록 가져오기
	
	public void bottleInsert(MainVO mvo);//bottle등록
	public Integer selectLabelid();//labelid가져오기
	public void letterInsert(MainVO mvo);//letter등록
	public void receivertableInsert(MainVO mvo);//letter등록
	
	
	public List<MainVO> read(String labelid);//편지번호로 글 읽어오기
	public int deleteBottle(String labelid);//유리병 번호로 bottle 삭제하기
	public int deleteLetter(String labelid);//유리병 번호로 Letter 삭제하기
	public int deleteReceivertable(String labelid);//유리병 번호로 Receivertable 삭제하기
	public int deleteBoast(String labelid);//유리병 번호로 Receivertable 삭제하기
	
	
	
	
	public List<MainVO> getCategoryList(); //카테고리 가져오기
	//리플관련
	public void boastInsert(MainVO mvo); //리플db 튜플생성
	
	//자랑게시판 관련
	public List<MainVO> getBoastList(); //자랑게시판 전체 목록 가져오기
	public List<MainVO> getMyBoastList(int customerNo); //나의 자랑게시판 목록 가져오기.
	
	
	//받은 모든 유리병 페이징 처리해서 가져오는 인터페이스 추가 예정
	
	
}


