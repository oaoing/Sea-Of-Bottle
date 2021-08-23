package org.sob.mapper;

import java.util.List;

import org.sob.domain.MainVO;

public interface MainMapper {
	public List<MainVO> getList(String userid); //받은 모든 유리병 목록 가져오기
	public void insert(MainVO main);//내가 쓴 편지 등록
	public MainVO read(String groupId);//편지번호로 글 읽어오기
	public int delete(String groupId);//유리병 번호로 글 삭제하기
	//받은 모든 유리병 페이징 처리해서 가져오는 인터페이스 추가 예정
}


