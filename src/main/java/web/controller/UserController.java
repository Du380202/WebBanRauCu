package web.controller;

import org.hibernate.Transaction;
import org.mindrot.jbcrypt.BCrypt;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import web.dao.OrderDao;
import web.dao.UserDao;
import web.entity.Categories;
import web.entity.Orders;
import web.entity.Users;

@Controller
public class UserController {
	@Autowired
	SessionFactory factory;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private OrderDao orderDao;
	
	@RequestMapping(value="DangKy", method = RequestMethod.GET)
	public String signUp(ModelMap model) {
		 model.addAttribute("user", new Users());
		return "Login/SignUp";
	}
	
	@RequestMapping(value="DangKy", method = RequestMethod.POST)
	public String createAccount(ModelMap model, @ModelAttribute("user") Users user, BindingResult errors) {
		if(user.getUserName().trim().length() == 0) {
			errors.rejectValue("UserName", "user", "Vui lòng nhập tên đăng nhập!");
		}
		
		if(user.getPassword().trim().length() == 0) {
			errors.rejectValue("password", "user", "Vui lòng nhập mật khẩu!");
		}
		
		if(user.getEmail().trim().length() == 0) {
			errors.rejectValue("email", "user", "Vui lòng nhập email!");
		}
		if(errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau đây!");
		}
		else {
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				String hashedPassword = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
				user.setPassword(hashedPassword);
				session.save(user);
				t.commit();
				model.addAttribute("messageT", "Đăng ký thành công");
			}
			catch (Exception e) {
				t.rollback();
				model.addAttribute("message", "Tên đăng nhập đã tồn tại");
			}
			finally {
				session.close();
			}
		}
		
		return "Login/SignUp";
	}
	@RequestMapping(value="DangNhap", method = RequestMethod.GET)
    public String showLoginForm(ModelMap model) {
		model.addAttribute("user", new Users());
        return "Login/login";
	}
	
	@RequestMapping(value="DangNhap", method = RequestMethod.POST) 
	public String processLogin(ModelMap model, @ModelAttribute("user") Users user, HttpServletRequest request) {
		if (userDao.authenticateUser(user.getUserName(), user.getPassword())) {
			HttpSession session = request.getSession();
			
			if(user.getUserName().equals("Admin")) {
				session.setAttribute("loggedInAdmin", user);
				return "redirect:/AdminProduct";
			}
			else {
				session.setAttribute("loggedInUser", user);
				return "redirect:/Home";
			}
		}
		else {
			if (user.getUserName().length() == 0 || user.getPassword().length() == 0) {
				
				if(user.getUserName().length() == 0)
					model.addAttribute("messageAccount", "Tài khoản chưa nhập");
				if(user.getPassword().length() == 0)
					model.addAttribute("messagePass", "Mật khẩu chưa nhập");
			}
			else {
				if(userDao.authenticateUser(user.getUserName(), user.getPassword()) == false) 
					model.addAttribute("messageLogin", "Tài khoản hoặc mật khẩu không chính xác");
			}
			return "Login/login";
		}
		
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET) 
	public String logout(HttpServletRequest request, HttpSession session) {
	    session.removeAttribute("loggedInUser");
	    return "redirect:" + request.getHeader("Referer");
	}
	
	@RequestMapping(value="EditUser/{userName}", method = RequestMethod.GET) 
	public String editUser(ModelMap model, @PathVariable("userName") String userName) {
		model.addAttribute("editUser", userDao.getUserByUserName(userName));
		return "user/editUser";
	}
	
	@RequestMapping(value="EditUser",method=RequestMethod.POST)
	public String editUser(ModelMap model,@ModelAttribute("editUser") Users editUser) {
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			
			try {
				
				session.update(editUser);
				t.commit();
				model.addAttribute("messageE","Lưu thành công!");
			}
			catch(Exception ex){
				t.rollback();
				model.addAttribute("messageE","Lưu thất bại! ");
				
			}
			finally {
				session.close();
			}
			return "user/editUser";
	}
	
	@RequestMapping(value = "ViewOrder/{userName}", method = RequestMethod.GET)
	public String viewOrder(ModelMap model, @PathVariable("userName") String userName) {
	    model.addAttribute("order", orderDao.getDataOrderByUser(userName));
		
	    return "user/orderDetail";
	}
	
}
