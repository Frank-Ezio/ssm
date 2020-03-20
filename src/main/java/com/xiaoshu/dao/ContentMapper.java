package com.xiaoshu.dao;

import java.util.List;

import com.xiaoshu.entity.Content;
import com.xiaoshu.entity.Count;
import com.xiaoshu.entity.Style;

public interface ContentMapper {

	
	List<Content> findALL(Content c);
	
	List<Style> findSt();

	List<Content> findByName(String title);

	void add(Content c);

	void del(int parseInt);

	List<Count> c();


}