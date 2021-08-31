package org.sob.mapper;

import java.util.List;

import org.sob.domain.Criteria;
import org.sob.domain.MainVO;
import org.sob.domain.ReplyVO;
import org.sob.domain.UserVO;

public interface MainMapper {
	public List<MainVO> getList(Criteria cri); //내가 받은 모든 유리병 목록 가져오기
	public int getListTotal(Criteria cri);//내가 포함된 유리병 목록 불러오기용 total
	
	public List<MainVO> getListUseCategory(Criteria cri); //내가 받은 모든 유리병 목록 카테고리로 가져오기
	public int getListUseCategoryTotal(Criteria cri);//내가 포함된 유리병 목록 불러오기용 total
	
	public void bottleInsert(MainVO mvo);//bottle등록
	public Integer selectLabelid();//labelid가져오기
	public void letterInsert(MainVO mvo);//letter등록
	public void receivertableInsert(MainVO mvo);//letter등록
	
	
	public List<MainVO> read(String labelid);//편지번호로 글 읽어오기
	public int deleteBottle(String labelid);//첫 글쓴이가 목록에서 글 삭제 
	public int deleteReceiver(MainVO mvo);//받은 사람이 목록에서 글 삭제
	
	
	public void updateBoast(MainVO mvo);//마지막 편지 받은 사람이 자랑할지 말지 선택하는 매퍼
	
	
	
	public List<MainVO> getCategoryList(); //카테고리 가져오기
	//리플관련
	public void boastInsert(MainVO mvo, int customerno); //리플db 튜플생성
	
	//자랑게시판 관련
	public List<MainVO> getBoastList(); //자랑게시판 전체 목록 가져오기
	
	public List<MainVO> getBoastListUseCategory(int categoryid); //자랑게시판 전체 목록 카테고리로 가져오기
	
	public List<MainVO> getMyBoastList(int customerNo); //나의 자랑게시판 목록 가져오기.
	
	public List<MainVO> getMyBoastListUseCategory(MainVO mvo); //나의 자랑게시판 목록 카테고리로 가져오기.
	//고객번호가져오기
	public List<UserVO> getCustomerNo();
	
	//마지막으로 받은사람 찾기
	public int readLast(String labelid);
	
	
	//받은 모든 유리병 페이징 처리해서 가져오는 인터페이스 추가 예정
	
	
}


