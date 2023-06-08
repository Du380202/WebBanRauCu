package web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder.In;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dao.CartDao;
import web.dao.OrderDao;
import web.dto.cartDto;
import web.entity.OrderDetails;
import web.entity.Orders;
//import web.entity.OrderDetail;
import web.entity.Users;

@Controller
public class CartController {
	@Autowired
	private CartDao cartDao = new CartDao(); 
	@Autowired
	SessionFactory factory;
	@Autowired
	private OrderDao orderDao;
	
	public int orderID() {
		int orderId = orderDao.getDataOrder().size();
		return orderId;
	}
	


	
	@RequestMapping(value= "Cart")
	public String cart(ModelMap model) {
		model.addAttribute("user", new Users());
		return "user/cart";
	}
	
	@RequestMapping (value="AddCart/{id}")
	public String addCart(HttpServletRequest request ,HttpSession session, @PathVariable int id) {
		@SuppressWarnings("unchecked")
		HashMap<Integer, cartDto> cart = (HashMap<Integer, cartDto>)session.getAttribute("Cart");
		if (cart == null) {
			cart = new HashMap<Integer, cartDto>();
		}
		
		cart = cartDao.addCart(id, cart); 
		session.setAttribute("Cart", cart);
		session.setAttribute("TotalPrice", cartDao.totalPrice(cart));

		return "redirect:" + request.getHeader("Referer");
	}
	
	@RequestMapping(value="RemoveCart/{id}")
	public String removeCart(HttpServletRequest request ,HttpSession session, @PathVariable int id) {
		@SuppressWarnings("unchecked")
		HashMap<Integer, cartDto> cart = (HashMap<Integer, cartDto>)session.getAttribute("Cart");
		if (cart == null) {
			cart = new HashMap<Integer, cartDto>();
		}
		cart = cartDao.deleteCart(id, cart); 
		session.setAttribute("Cart", cart);
		session.setAttribute("TotalPrice", cartDao.totalPrice(cart));
		return "redirect:" + request.getHeader("Referer");
	}
	@RequestMapping(value= "Cart", method = RequestMethod.GET)
	public String saveOrder(ModelMap model) {
		model.addAttribute("order", new Orders());
		return "user/cart";
	}
	
	@RequestMapping(value="PlaceOrder", method = RequestMethod.POST)
	public String saveOrder(ModelMap model, @ModelAttribute("order") Orders order, 
	        HttpSession httpSession, HttpServletRequest request, BindingResult errors) {
	    Session session = null;
	    Transaction t = null;
	    try {
	        session = factory.openSession();
	        t = session.beginTransaction();
	        int orderId = orderID();
	        try {
	            if(order.getTotalMoney() > 0 && order.getPhoneNumber().trim().length() != 0
	                    && order.getAddress().trim().length() != 0) {                
	                orderId++;
	                order.setOrderID(orderId);
	                session.save(order);
	                t.commit();
	                model.addAttribute("messageCart", "Đặt hàng thành công!");
	            }
	            else {            
	                model.addAttribute("messageCart", "Vui lòng nhập đầy đủ thông tin!");
	            }
	        }
	        catch (Exception e) {
	            if (t != null) {
	                t.rollback();
	            }
	            model.addAttribute("messageCart", "Đặt hàng thất bại!");
	        }
	        
	        // Thêm chi tiết đơn hàng
	        @SuppressWarnings("unchecked")
	        HashMap<Integer, cartDto> cart = (HashMap<Integer, cartDto>) httpSession.getAttribute("Cart");
	        if (cart != null && !cart.isEmpty()) {
	            Transaction tO = null;
	            Session sessionO = null;
	            try {
	                sessionO = factory.openSession();
	                tO = sessionO.beginTransaction();
	                int orderDetailID = orderDao.getDataOrderDetail().size() + 1; 
	                for (Map.Entry<Integer, cartDto> itemCart : cart.entrySet()) {
	                    OrderDetails orderDetail = new OrderDetails();
	                    orderDetail.setOrderDetailID(orderDetailID);
	                    orderDetail.setOrderID(orderId);
	                    orderDetail.setProductID(itemCart.getValue().getProduct().getProductID());
	                    orderDetail.setQuantity(itemCart.getValue().getQuantity());
	                    orderDetail.setTotalPrice(itemCart.getValue().getTotalPrice().intValue());
	                    sessionO.save(orderDetail);
	                    orderDetailID++;
	                }
	                tO.commit();
	            }
	            catch (Exception e) {
	                if (tO != null) {
	                    tO.rollback();
	                }
	            }
	            finally {
	                if (sessionO != null) {
	                    sessionO.close();
	                }
	            }
	        }
	        
	        httpSession.removeAttribute("Cart");
	        httpSession.removeAttribute("TotalPrice");
	    }
	    catch (Exception e) {
	        model.addAttribute("messageCart", "Đặt hàng thất bại!");
	    }
	    finally {
	        if (session != null) {
	            session.close();
	        }
	    } 

	    return "user/cart";
	}
}
