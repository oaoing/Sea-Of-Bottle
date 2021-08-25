package org.sob.service;

import java.util.List;

import org.sob.domain.ReplyVO;
import org.sob.mapper.MainMapper;
import org.sob.mapper.ReplyMapper;

public class ReplyServiceImpl implements ReplyService {

	private ReplyMapper mapper;
	
	@Override
	public void boastInsertReply(ReplyVO rvo) {
		
		mapper.boastInsertReply(rvo);
		
	}

	
	@Override
	public List<ReplyVO> readReply(String groupId) {
		
		return mapper.readReply(groupId);
	}

}
