package com.websystique.springmvc.service;

import java.util.List;

import com.websystique.springmvc.model.NewsConten;;


public interface NewsService {
	
	NewsConten findById(int id);
	
	void saveNews(NewsConten news);
	
	void updateNews(NewsConten news);
	
	void deleteNewByID(int ID);

	List<NewsConten> findAllNews(); 
	
	boolean isNewIDUnique(Integer id);

}