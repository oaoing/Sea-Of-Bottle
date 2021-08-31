package org.sob.service;

import java.util.List;

import org.sob.domain.Criteria;
import org.sob.domain.ReplyCountVO;
import org.sob.domain.ReplyVO;
import org.springframework.stereotype.Service;
@Service
public interface ReplyService {
	//리플달기
		public int boastInsertReply(ReplyVO rvo);
		//리플가져오기
		public List<ReplyVO> readReply(int labelid);
		// 사용자 번호로 리플 가져오기
		public ReplyCountVO readMyReply(Criteria cri);
		// 리플 삭제
		public int deleteReply(int replyno);
}
