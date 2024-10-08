package com.kh.fitguardians.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class PageInfo {

	private int listCount;
	private int currentPage;
	private int pageLimit;
	private int boardLimit; 
	
	private int startPage;
	private int endPage;
	private int maxPage;
	
	
	
}
