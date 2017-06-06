package com.websystique.springmvc.dao;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.websystique.springmvc.model.NewsConten;
import com.websystique.springmvc.model.UserDocument;;

@Repository("newsDao")
public class NewsDaoImpl extends AbstractDao<Integer, NewsConten> implements NewsDao {

	public NewsConten findById(int id) {
		NewsConten conten= getByKey(id);
		return conten;
	}

	public NewsConten findByID(String id) {
		System.out.println("id : "+id);
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("id", id));
		NewsConten content = (NewsConten)crit.uniqueResult();
		return content;
	}

	@SuppressWarnings("unchecked")
	public List<NewsConten> findAllNews() {
	    Criteria crit = createEntityCriteria();
        return (List<NewsConten>)crit.list();
	}

	public void save(NewsConten content) {
		persist(content);
	}

	public void deleteById(int id) {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("id", id));
		NewsConten content = (NewsConten)crit.uniqueResult();
		delete(content);
	}
}