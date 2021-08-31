package org.sob.domain;

import java.util.List;

import lombok.Data;

@Data
public class ReplyCountVO {
	private int totalCount;
	private List<ReplyVO> rvo;
}
