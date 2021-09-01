package org.sob.service;

import java.util.List;

import org.sob.domain.Criteria;
import org.sob.domain.MainVO;
import org.sob.domain.ReplyVO;

public interface MainService {
	//글등록
	public void register(MainVO mvo);
	//추가 글등록
	public void registerAdd(MainVO mvo);
	
	
	//글 읽기
	public List<MainVO> get(String labelid);
	//내 목록에서 지우기 첫 글쓴이 용
	public boolean remove(String labelid);
	//내 목록에서 지우기 받은 사람용
	public boolean remove2(MainVO mvo);
	
	//자랑하기 선택
	public void updateBoast(MainVO mvo);
	
	//내목록 읽기
	public List<MainVO> getList(Criteria cri);
	public int getTotal(Criteria cri);
	//카테고리로 내목록읽기
	public List<MainVO> getListUseCategory(Criteria cri);
	public int getListUseCategoryTotal(Criteria cri);
	//카테고리 가져오기
	public List<MainVO> getCategoryList();
	//자랑게시판 전체목록
	public List<MainVO> getBoastList();
	
	public List<MainVO> getBoastListUseCategory(int categoryid);
	
	//나의 자랑 목록
	public List<MainVO> getMyBoastList(Criteria cri);
	public int getMyBoastListTotal(Criteria cri);
	
	//나의 자랑 목록 카테고리로 가져오기
	public List<MainVO> getMyBoastListUseCategory(Criteria cri);
	public int getMyBoastListUseCategoryTotal(Criteria cri);
	//마지막 받는사람 찾기
	public int readLast(String labelid);
	
	
	
	
	
	
	
}
