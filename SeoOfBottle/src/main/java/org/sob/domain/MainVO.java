package org.sob.domain;

import lombok.Data;

@Data
public class MainVO {

	private int from;
	private int to;
	private int cnt;
	private String groupId;
	private String contents;
	private int letterId;
	private int categoryId;
	private String category;
	private String boast;//자랑하기 게시판으로 보낼지 
	
		
}
