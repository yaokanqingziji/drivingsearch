package com.core.base;

import org.springframework.beans.factory.annotation.Autowired;

import com.ldw.frame.base.BaseBpo;
import com.search.base.SearchGlobalNames;

public class SearchBaseBpo extends BaseBpo {
	
	@Autowired
	protected SearchGlobalNames globalName;
}
