package web.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import web.dto.cartDto;
import web.entity.OrderDetails;
import web.entity.Orders;
import web.entity.Products;

@Transactional
@Repository
public class OrderDao {

	@Autowired
	private SessionFactory factory;
	
	private int orderDetailID;
	
	public List<Orders> getDataOrder() { 
		Session session = factory.getCurrentSession();
		String hql = "FROM Orders";
		Query query = session.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Orders> order = query.list();
		return order;
	}
	public Orders getOrderByID(int id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Orders WHERE OrderID = " + id;
		Query query = session.createQuery(hql);
		Orders order = (Orders) query.uniqueResult();
		return order;
	}
	public List<OrderDetails> getDataOrderDetail() { 
		Session session = factory.getCurrentSession();
		String hql = "FROM OrderDetails";
		Query query = session.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<OrderDetails> orderDetail = query.list();
		return orderDetail;
	}
	
	public List<Orders> getDataOrderByUser(String userName) { 
		Session session = factory.getCurrentSession();
		String hql = "FROM Orders WHERE UserName = '" + userName + "'";
		Query query = session.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Orders> orders = query.list();
		return orders;
	}
	
	
}
