package org.sob.service;

import java.util.List;

import org.sob.domain.MainVO;

public interface MainService {
	//1.글등록
	public void register(MainVO main);
	//2.글 읽기
	public List<MainVO> get(String groupId);
	//4.글 삭제
	public boolean remove(String groupId);
	//5.목록 읽기
	public List<MainVO> getList(int cno);
	
	public List<MainVO> getCategoryList();
}
