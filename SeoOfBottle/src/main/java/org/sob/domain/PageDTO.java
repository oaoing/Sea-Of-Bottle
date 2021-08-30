package org.sob.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
	//시작페이지 번호, 끝페이지 번호, 이전가기, 다음가기
	//실제 전체페이지, criteria (현재페이지, 몇개씩 보여줄지)
	
	private int startPage;
	private int endPage;
	private boolean prev,next;
	
	private int total;//전체 db의 행 개수
	
	private Criteria cri;
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		endPage = (int)(Math.ceil(cri.getPageNum()/10.0)*10);
		System.out.println(cri.getPageNum());
		startPage = endPage-9;
		
		int realEnd = (int)Math.ceil((double)total/cri.getAmount());//실제 끝페이지
		if(realEnd<endPage) {
			endPage = realEnd;
		}
		prev = startPage >1;
		next = endPage<realEnd;
		
		
		
		
		
	}
	
	

}
