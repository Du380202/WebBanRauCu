package web.controller;

import java.util.List;

import javax.transaction.Transactional;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import web.dao.Categorys;
import web.dao.OrderDao;
import web.dao.ProductDao;
import web.dao.UserDao;
import web.entity.Categories;
import web.entity.Orders;
import web.entity.Products;
import web.entity.Users;
@Transactional
@Controller
public class AdminController {
	@Autowired
	private SessionFactory factory;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private Categorys category;
	
	@Autowired
	private OrderDao orderDao;
	
	 
	public int productID() {
		int productID = productDao.getDataProduct().size();
		return productID;
	}
	
	
	@RequestMapping(value="AdminUser") 
	public String adminUser(ModelMap model) {
		List<Users> users = userDao.getDataUser();
        model.addAttribute("userData", users);
		return "admin/adminUser";
	}
	@RequestMapping(value="AdminProduct") 
	public String adminProduct(ModelMap model) {
		List<Products> products = productDao.getDataProduct();
        model.addAttribute("products", products);
		return "admin/adminProduct";
	}
	

	
	@RequestMapping(value="AddProduct", method = RequestMethod.GET) 
	public String addProduct(ModelMap model) {
		model.addAttribute("product", new Products());
		model.addAttribute("productID", productID() + 1);
		model.addAttribute("categories", category.getDataCategories());
		return "admin/addProduct";
	}
	
	@RequestMapping(value="AddProduct", method = RequestMethod.POST)
	public String addNewProduct(ModelMap model, @ModelAttribute("product") Products product) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
				product.setProductID(productID() + 1);
				session.save(product);
				t.commit();
				model.addAttribute("messageAddP", "Thêm sản phẩm thành công");
		}
		catch (Exception e) {
			t.rollback();
			model.addAttribute("messageAddP", "Thêm sản phẩm thất bại");
		}
		finally {
			session.close();
		}
		return "admin/addProduct";
	}
	
	
	@RequestMapping(value="AddUser", method = RequestMethod.GET) 
	public String addUser(ModelMap model) {
		model.addAttribute("users", new Users());
		return "admin/addUser";
	}
	@RequestMapping(value="AddUser", method = RequestMethod.POST)
	public String createAccount(ModelMap model, @ModelAttribute("users") Users user) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
				session.save(user);
				t.commit();
				model.addAttribute("messageAddU", "Thêm mới thành công");
		}
		catch (Exception e) {
			t.rollback();
			model.addAttribute("messageAddU", "Thêm mới thất bại");
		}
		finally {
			session.close();
		}
		return "admin/addUser";
	}
	
	
	@RequestMapping(value="EditProduct/{productID}", method = RequestMethod.GET) 
	public String editProduct(ModelMap model, @PathVariable("productID") int productID) {
		model.addAttribute("editProduct", productDao.getProductByID(productID));
		model.addAttribute("categories", category.getDataCategories());
		return "admin/editProduct";
	}
	
	
	@RequestMapping(value="EditProduct", method=RequestMethod.POST)
	public String editProduct(ModelMap model,@ModelAttribute("editProduct") Products editProduct) {
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			
			try {
				
				session.update(editProduct);
				t.commit();
				model.addAttribute("messageEP","Lưu thành công!");
			}
			catch(Exception ex){
				t.rollback();
				model.addAttribute("messageEP","Lưu thất bại! ");
				
			}
			finally {
				session.close();
			}
			return "admin/editProduct";
	}

	
	@RequestMapping(value="AdminOrder") 
	public String admimOrder(ModelMap model) {
        model.addAttribute("order", orderDao.getDataOrder());
		return "admin/adminOrder";
	}
	
	@RequestMapping(value="OrderShip/{orderID}", method = RequestMethod.GET) 
	public String orderShip(ModelMap model, @PathVariable("orderID") int orderID) {
		model.addAttribute("order",orderDao.getOrderByID(orderID));
		return "admin/adminOrder";
	}

	@RequestMapping(value = "OrderShip", method = RequestMethod.POST)
	public String orderShipPost(@RequestParam("orderID") int orderID) {
	    Session session = factory.openSession();
	    Transaction t = session.beginTransaction();

	    try {
	        Orders existingOrder = (Orders) session.get(Orders.class, orderID);
	        existingOrder.setDelivered(1);
	        session.update(existingOrder);
	        t.commit();
	    } catch (Exception ex) {
	        t.rollback();
	    } finally {
	        session.close();
	    }

	    return "redirect:/AdminOrder";
	}
	
	@RequestMapping(value = "EnableProduct", method = RequestMethod.POST)
	public String enableProduct(@RequestParam("productID") int productID) {
	    Session session = factory.openSession();
	    Transaction t = session.beginTransaction();

	    try {
	    	Products existingProduct = (Products) session.get(Products.class, productID);
	    	existingProduct.setStatus(1);
	        session.update(existingProduct);
	        t.commit();
	    } catch (Exception ex) {
	        t.rollback();
	    } finally {
	        session.close();
	    }

	    return "redirect:/AdminProduct";
	}
	
	@RequestMapping(value = "DisableProduct", method = RequestMethod.POST)
	public String disableProduct(@RequestParam("productID") int productID) {
	    Session session = factory.openSession();
	    Transaction t = session.beginTransaction();

	    try {
	        Products existingProduct = (Products) session.get(Products.class, productID);
	        existingProduct.setStatus(0);
	        session.update(existingProduct);
	        t.commit();
	    } catch (Exception ex) {
	        t.rollback();
	    } finally {
	        session.close();
	    }

	    return "redirect:/AdminProduct";
	}
}


