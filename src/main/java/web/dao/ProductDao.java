package web.dao;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import web.dto.cartDto;
import web.entity.Products;

@Transactional
@Repository
public class ProductDao {
	@Autowired
	private SessionFactory factory;
	
	public List<Products> getDataProduct() { 
		Session session = factory.getCurrentSession();
		String hql = "FROM Products";
		Query query = session.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Products> products = query.list();
		
		return products;
	}
	
	public List<Products> getDataProductpagin(int currentPage, int pageSize, int startRow) { 
		
		Session session = factory.getCurrentSession();
		String hql = "FROM Products where Status = 1 ORDER BY ProductID";
		Query query = session.createQuery(hql);
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		@SuppressWarnings("unchecked")
		List<Products> products = query.list();
		return products;
	}
	
	public List<Products> getDataProductByCategory(int currentPage, int pageSize, int startRow, String category) { 
		
		Session session = factory.getCurrentSession();
		String hql = "FROM Products WHERE Category = '" + category + "' And Status = 1 ORDER BY ProductID";
		Query query = session.createQuery(hql);
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		@SuppressWarnings("unchecked")
		List<Products> products = query.list();
		return products;
	}
	
	public Products getProductByID(int id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Products WHERE ProductID = " + id;
		Query query = session.createQuery(hql);
		Products product = (Products) query.uniqueResult();
		return product;
	}
	
	public List<Products> getDataNew() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Products ORDER BY ProductID DESC";
		Query query = session.createQuery(hql);
		query.setMaxResults(8);
		@SuppressWarnings("unchecked")
		List<Products> products = query.list();
		return products;
	}
	
	public List<Products> getDataFourProducts() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Products";
		Query query = session.createQuery(hql);
		query.setMaxResults(4);
		@SuppressWarnings("unchecked")
		List<Products> products = query.list();
		return products;
	}
	
	public List<Products> getDataByKeyWord(String key) {
		Session session = factory.getCurrentSession();
		String hql = "From Products where ProductName like :keyword and Status = 1";
		Query query = session.createQuery(hql);
		query.setParameter("keyword", "%" + key + "%");
		@SuppressWarnings("unchecked")
		List<Products> products = query.list();
		return products;
	}
	public int getTotalProductByCategory(String category) {
	    Session session = factory.getCurrentSession();
	    String hql = "SELECT COUNT(*) FROM Products WHERE category = :category";
	    Query query = session.createQuery(hql);
	    query.setParameter("category", category);
	    Long count = (Long) query.uniqueResult();
	    return count != null ? count.intValue() : 0;
	}

	public int getTotalProduct() {
		Session session = factory.getCurrentSession();
	    String hql = "SELECT COUNT(*) FROM Products";
	    Query query = session.createQuery(hql);
	    Long count = (Long) query.uniqueResult();
	    return count != null ? count.intValue() : 0;
	}
}

