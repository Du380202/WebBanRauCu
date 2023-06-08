package web.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Orders")
public class Orders {
	@Id
	private Integer OrderID;
	private String OrderDate;
	private double TotalMoney;
	private String Address;
	private String PhoneNumber;
	private String UserName;
	private int Delivered;
	public int getDelivered() {
		return Delivered;
	}
	public void setDelivered(int delivered) {
		Delivered = delivered;
	}
	public String getPhoneNumber() {
		return PhoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		PhoneNumber = phoneNumber;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public Integer getOrderID() {
		return OrderID;
	}
	public void setOrderID(Integer orderID) {
		OrderID = orderID;
	}
	public String getOrderDate() {
		return OrderDate;
	}
	public void setOrderDate(String orderDate) {
		OrderDate = orderDate;
	}
	public double getTotalMoney() {
		return TotalMoney;
	}
	public void setTotalMoney(double totalMoney) {
		TotalMoney = totalMoney;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
}
