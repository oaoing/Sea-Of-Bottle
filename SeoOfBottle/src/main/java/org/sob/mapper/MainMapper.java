package org.sob.mapper;

import java.util.List;

import org.sob.domain.MainVO;
import org.sob.domain.ReplyVO;

public interface MainMapper {
	public List<MainVO> getList(int customerNo); //내가 받은 모든 유리병 목록 가져오기
	public void insert(MainVO mvo);//내가 쓴 편지 등록
	public List<MainVO> read(String groupId);//편지번호로 글 읽어오기
	public int delete(String groupId);//유리병 번호로 글 삭제하기
	public List<MainVO> getCategoryList(); //카테고리 가져오기
	//리플관련
	public void boastInsert(MainVO mvo); //리플db 튜플생성
	
	//자랑게시판 관련
	public List<MainVO> getBoastList(); //자랑게시판 전체 목록 가져오기
	public List<MainVO> getMyBoastList(int cno); //나의 자랑게시판 목록 가져오기.
	
	
	//받은 모든 유리병 페이징 처리해서 가져오는 인터페이스 추가 예정
	
	
}


