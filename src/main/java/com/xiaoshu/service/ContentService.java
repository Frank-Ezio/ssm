package com.xiaoshu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xiaoshu.dao.ContentMapper;
import com.xiaoshu.entity.Content;
import com.xiaoshu.entity.Count;
import com.xiaoshu.entity.Style;

@Service
public class ContentService {

	@Autowired
	ContentMapper contentMapper;

	
	public PageInfo<Content> findcontentPage(Content content, int pageNum, int pageSize, String ordername, String order) {
		PageHelper.startPage(pageNum, pageSize);
		List<Content> contentList = contentMapper.findALL(content);
		PageInfo<Content> pageInfo = new PageInfo<Content>(contentList);
		return pageInfo;
	}


	public List<Style> findSt() {
		// TODO Auto-generated method stub
		return contentMapper.findSt();
	}


	public List<Content> findByName(String title) {
		// TODO Auto-generated method stub
		return contentMapper.findByName(title);
	}


	public void addcontent(Content c) {
		// TODO Auto-generated method stub
		contentMapper.add(c);
	}


	public void deletecontent(int parseInt) {
		// TODO Auto-generated method stub
		contentMapper.del(parseInt);
	}


	public List<Count> c() {
		// TODO Auto-generated method stub
		return contentMapper.c();
	}


}
