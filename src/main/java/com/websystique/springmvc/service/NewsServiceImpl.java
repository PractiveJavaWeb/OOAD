package com.websystique.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.websystique.springmvc.dao.NewsDao;
import com.websystique.springmvc.model.NewsConten;
import com.websystique.springmvc.model.UserDocument;;


@Service("newsService")
@Transactional
public class NewsServiceImpl implements NewsService{

	@Autowired
	private NewsDao dao;

	public NewsConten findById(int id) {
		return dao.findById(id);
	}

	@Override
	public void saveNews(NewsConten news) {
		dao.save(news);
		
	}

	@Override
	public void updateNews(NewsConten news) {
		NewsConten entity = dao.findById(news.getId());
		if(entity!=null){
			entity.setTitle(news.getTitle());
			entity.setContent(news.getContent());
		}
		
	}

	@Override
	public void deleteNewByID(int ID) {
		dao.deleteById(ID);
		
	}

	@Override
	public boolean isNewIDUnique(Integer id) {
		NewsConten content = findById(id);
		return ( content == null || ((id != null) && (content.getId() == id)));
	}

	@Override
	public List<NewsConten> findAllNews() {
		return dao.findAllNews();
	}
	
}
