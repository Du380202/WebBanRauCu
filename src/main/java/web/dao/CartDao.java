package web.dao;

import web.dto.cartDto;
import web.entity.Products;

import java.util.HashMap;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Transactional
@Repository
public class CartDao {
	@Autowired
	ProductDao proDao = new ProductDao();
	
	public HashMap<Integer, cartDto> addCart(int id, HashMap<Integer, cartDto> cart) {
		cartDto itemCart = new cartDto();
		
		Products product = proDao.getProductByID(id);
		if (product != null && cart.containsKey(id)) 
		{
			itemCart = cart.get(id);
			itemCart.setQuantity(itemCart.getQuantity()+1);
			itemCart.setTotalPrice(itemCart.getQuantity() * itemCart.getProduct().getPrice());
		}
		else {
			itemCart.setProduct(product);
			itemCart.setQuantity(1);
			itemCart.setTotalPrice(product.getPrice());
		}
		cart.put(id, itemCart);
		
		return cart;
	}
	
	public HashMap<Integer, cartDto> editCart(int id, int quanty, HashMap<Integer, cartDto> cart) {
		if (cart == null) {
			return cart;
		}
		cartDto itemCart = new cartDto();
		if (cart.containsKey(id) ) {
			itemCart = cart.get(id);
			itemCart.setQuantity(quanty);
			double totalPrice = quanty* itemCart.getProduct().getPrice();
			itemCart.setTotalPrice(totalPrice);
			
		}
		cart.put(id, itemCart);
		
		return cart;
	}
	
	public HashMap<Integer, cartDto> deleteCart(int id, HashMap<Integer, cartDto> cart) {
		if (cart == null) {
			return cart;
		}
		if (cart.containsKey(id) ) {
			cart.remove(id);
			
		}
		return cart;
	}
	
	public double totalPrice(HashMap<Integer, cartDto> cart ) {
		double total = 0;
		for(Map.Entry<Integer, cartDto> itemCart : cart.entrySet()) {
			total += itemCart.getValue().getTotalPrice(); 
		}
		
		return total;
	}
}	
