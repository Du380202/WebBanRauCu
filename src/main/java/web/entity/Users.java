package web.entity;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Users")
public class Users {
	@Id
//	private int UserID;
	private String UserName;
	private String Password;
	private String Address;
	private String Email;
	private String PhoneNumber;

//	public int getUserID() {
//		return UserID;
//	}
//	public void setUserID(int userID) {
//		UserID = userID;
//	}
	public String getPhoneNumber() { return PhoneNumber; } 
	  
	public void  setPhoneNumber(String phoneNumber) {
		  PhoneNumber = phoneNumber; 
	}
	 
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}

	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	
	
	
}
