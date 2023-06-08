package web.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Categories")
public class Categories {
	@Id
//	private int CategoryID;
	private String CategoryName;
//	
//	
//	public int getCategoryID() {
//		return CategoryID;
//	}
//	public void setCategoryID(int categoryID) {
//		CategoryID = categoryID;
//	}
	public String getCategoryName() {
		return CategoryName;
	}
	public void setCategoryName(String categoryName) {
		CategoryName = categoryName;
	}
	
}
