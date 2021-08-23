package org.sob.domain;

import lombok.Data;

@Data
public class MainVO {

	String from;
	String to;
	int cnt;
	String groupId;
	String contents;
	int letterId;
	int categoriId;
	String boast;//자랑하기 게시판으로 보낼지 
		
}
