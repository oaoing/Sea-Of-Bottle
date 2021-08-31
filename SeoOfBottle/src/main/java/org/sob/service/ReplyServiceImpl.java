package org.sob.service;

import java.util.List;

import org.sob.domain.Criteria;
import org.sob.domain.MainVO;
import org.sob.domain.ReplyVO;
import org.sob.mapper.MainMapper;
import org.sob.mapper.ReplyMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Log4j
@Service
public class ReplyServiceImpl implements ReplyService {

	private ReplyMapper mapper;
	
	@Override
	public int boastInsertReply(ReplyVO rvo) {
		
		return mapper.boastInsertReply(rvo);
		
	}

	@Override
	public List<ReplyVO> readReply(int labelid) {
		
		return mapper.readReply(labelid);
	}
	
	@Override
	public List<ReplyVO> readMyReply(Criteria cri) {
		log.info("내가쓴 댓글 목록"+cri);
		int original = cri.getPageNum();
		int page = (original-1)*10;
		cri.setPageNum(page);
		List<ReplyVO> rvo = mapper.readMyReply(cri);
		
		return rvo;
	}
	
	@Override
	public int deleteReply(int replyno) {
		return mapper.deleteReply(replyno);
	}
}
