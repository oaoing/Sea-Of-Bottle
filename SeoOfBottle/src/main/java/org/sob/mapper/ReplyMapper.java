package org.sob.mapper;

import org.sob.domain.ReplyVO;

public interface ReplyMapper {

	public int insert(ReplyVO vo) throws Exception;
	
	public ReplyVO read(int rno);
	
	public int delete(int rno);
	//리플 페이징처리 할 예정
	
}
