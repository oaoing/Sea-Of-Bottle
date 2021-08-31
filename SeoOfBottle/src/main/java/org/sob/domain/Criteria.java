package org.sob.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	private int pageNum;
	private int amount;
	private int customerno;
	private int categoryid;
	
	public Criteria() {
		this.pageNum = 1;
		this.amount = 10;
		this.customerno = 0;
		this.categoryid = 0;
	}
	
	public Criteria(int pageNum,int amount,int customerno) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.customerno = customerno;
	}
	
}
