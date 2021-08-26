package org.sob.service;

import java.util.List;

import org.sob.domain.MainVO;
import org.sob.domain.ReplyVO;

public interface MainService {
	//글등록
	public void register(MainVO mvo);
	//글 읽기
	public List<MainVO> get(String labelid);
	//글 삭제
	public boolean remove(String labelid);
	//내목록 읽기
	public List<MainVO> getList(int customerNo);
	//카테고리 가져오기
	public List<MainVO> getCategoryList();
	//자랑게시판 전체목록
	public List<MainVO> getBoastList();
	//나의 자랑 목록
	public List<MainVO> getMyBoastList(int customerNo);
	
	
	
	
	
	
	
	
	
}
