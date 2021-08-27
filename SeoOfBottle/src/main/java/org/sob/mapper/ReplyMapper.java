package org.sob.mapper;

import java.util.List;

import org.sob.domain.ReplyVO;

public interface ReplyMapper {

	
	public List<ReplyVO> readReply(int labelid); //리플가져오기
	
	//리플 페이징처리 할 예정
	public int boastInsertReply(ReplyVO rvo);//리플 업로드
	
}
