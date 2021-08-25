package org.sob.service;

import java.util.List;

import org.sob.domain.ReplyVO;

public interface ReplyService {
	//리플달기
		public void boastInsertReply(ReplyVO rvo);
		//리플가져오기
		public List<ReplyVO> readReply(String groupId);
}
