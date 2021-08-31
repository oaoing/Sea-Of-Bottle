package org.sob.mapper;

import java.util.List;

import org.sob.domain.Criteria;
import org.sob.domain.ReplyVO;

public interface ReplyMapper {

	
	public List<ReplyVO> readReply(int labelid); //리플가져오기
	
	//리플 페이징처리 할 예정
	public int boastInsertReply(ReplyVO rvo);//리플 업로드
	
	
	public List<ReplyVO> readMyReply(Criteria cri); //나의리플가져오기
	public int readMyReplyTotal(Criteria cri);//나의리플가져오기total
	
	public int deleteReply(int replyno); //리플 삭제
}
