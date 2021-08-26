package org.sob.domain;

import lombok.Data;

@Data
public class MainVO {
	private int from;
	private int to;//보낼사람
	private int cnt;
	private int labelid;
	private String contents;
	private int letterid;
	private int categoryid;
	private String category;
	private int boast;//자랑하기 게시판으로 보낼지 
	
		
}
