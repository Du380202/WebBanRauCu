package web.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import web.entity.Categories;

@Transactional
@Repository
public class Categorys {
	@Autowired
	private SessionFactory factory;
	
	public List<Categories> getDataCategories() { 
		Session session = factory.getCurrentSession();
		String hql = "FROM Categories";
		Query que = session.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Categories> categories = que.list();
		return categories;
	}
}
