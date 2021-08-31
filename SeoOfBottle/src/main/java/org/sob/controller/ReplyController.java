package org.sob.controller;

import java.util.List;

import org.sob.domain.Criteria;
import org.sob.domain.PageDTO;
import org.sob.domain.ReplyVO;
import org.sob.service.ReplyService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/replies")
@AllArgsConstructor
public class ReplyController {//작성중
	
	private ReplyService service;
	
	@GetMapping("/pages/{labelid}")
	public List<ReplyVO> getList(@PathVariable("labelid") int labelid){
		log.info("댓글 불러오는 컨트롤러");
		return service.readReply(labelid);//수정중
		
	}
	
	//댓글등록
	@PostMapping(value="/new", consumes="application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> insertReply(@RequestBody ReplyVO rvo) {
		log.info("댓글 등록하는 컨트롤러");
		int insertCount;
		ResponseEntity<String> result = null;
		try {
			insertCount = service.boastInsertReply(rvo);
			log.info("댓글 등록 개수:"+insertCount);
			if(insertCount==1) {
				result=new ResponseEntity<>("success",HttpStatus.OK);
			}else {
				result=new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
		} catch (Exception e) {
			e.printStackTrace();
			result=new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
		
	}
	
	
	@GetMapping("/my/{customerno}/{page}")	// 작동 확인 O
	public List<ReplyVO> getListMyReply(@PathVariable("customerno") int customerno,@PathVariable("page") int page){
		log.info("개인 댓글 불러오는 컨트롤러");
		Criteria cri = new Criteria();
		cri.setCustomerno(customerno);
		cri.setPageNum(page);
		return service.readMyReply(cri);
		
	}
	
	@DeleteMapping(value="/del/{replyno}", produces= {MediaType.TEXT_PLAIN_VALUE})
	public String deleteReply(@PathVariable("replyno") int replyno){
		log.info("댓글 삭제");
		return service.deleteReply(replyno) == 1? "success":"error";
	}
	
}
