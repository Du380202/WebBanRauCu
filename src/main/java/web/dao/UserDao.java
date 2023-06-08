package web.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;

import web.entity.Products;
import web.entity.Users;

@Repository
@Transactional
@Controller
public class UserDao {
	@Autowired
	private SessionFactory factory;
	
	public Users getUserByID(int id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Users WHERE UserName = " + id;
		Query query = session.createQuery(hql);
		Users user = (Users) query.uniqueResult();
		return user;
		
	}
	
	public Users getUserByUserName(String username) {
		Session session = factory.getCurrentSession();
		return (Users) session.createQuery("FROM Users WHERE username = :username")
                .setParameter("username", username)
                .uniqueResult();
		
	}

	
	public boolean authenticateUser(String username, String password) {
        Users user = getUserByUserName(username);
        if (user != null && BCrypt.checkpw(password, user.getPassword())) {
        	return true;
        }
        return false;
    }
	
	public List<Users> getDataUser() { 
		Session session = factory.getCurrentSession();
		String hql = "FROM Users Where UserName <> 'Admin'";
		Query query = session.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Users> users = query.list();
		
		return users;
	}
	
}
