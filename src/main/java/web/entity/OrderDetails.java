package web.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="OrderDetails")
public class OrderDetails {
	@Id
	private Integer OrderDetailID;
	private Integer OrderID;
	private Integer ProductID;
	private Integer Quantity;
	private Integer TotalPrice;

	public Integer getTotalPrice() {
		return TotalPrice;
	}
	public void setTotalPrice(Integer totalPrice) {
		TotalPrice = totalPrice;
	}
	public Integer getOrderDetailID() {
		return OrderDetailID;
	}
	public void setOrderDetailID(Integer orderDetailID) {
		OrderDetailID = orderDetailID;
	}
	public Integer getOrderID() {
		return OrderID;
	}
	public void setOrderID(Integer orderID) {
		OrderID = orderID;
	}
	public Integer getProductID() {
		return ProductID;
	}
	public void setProductID(Integer productID) {
		ProductID = productID;
	}
	public Integer getQuantity() {
		return Quantity;
	}
	public void setQuantity(Integer quantity) {
		Quantity = quantity;
	}

	
	
}
