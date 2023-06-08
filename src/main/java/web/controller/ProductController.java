package web.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.opensymphony.module.sitemesh.filter.PageRequestWrapper;

import java.awt.print.Pageable;
import java.util.List;

import javax.transaction.Transactional;

import web.dao.*;
import web.entity.*;

@Transactional
@Controller
public class ProductController {
	@Autowired
	private Categorys categoryDao;
	@Autowired
	private ProductDao product;
	
	@RequestMapping("Product")
	public String product(ModelMap model, @RequestParam(defaultValue = "1") int currentPage, @RequestParam(defaultValue = "") String category) {
	    int pageSize = 12;
	    int startRow = (currentPage - 1) * pageSize;
	    List<Categories> categories = categoryDao.getDataCategories();
	    model.addAttribute("categories", categories);

	    List<Products> products;
	    int totalPage;

	    if (!category.isEmpty()) {
	        products = product.getDataProductByCategory(currentPage, pageSize, startRow, category);
	        int totalProductByCategory = product.getTotalProductByCategory(category);
	        totalPage = (int) Math.ceil((double) totalProductByCategory / pageSize);
	    } else {
	        products = product.getDataProductpagin(currentPage, pageSize, startRow);
	        int totalProduct = product.getTotalProduct();
	        totalPage = (int) Math.ceil((double) totalProduct / pageSize);
	    }

	    model.addAttribute("products", products);
	    model.addAttribute("totalPage", totalPage);
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("selectedCategory", category); 

	    return "user/product";
	}
	
	@RequestMapping(value="ProductDetail")
	public String productDetail(ModelMap model, @RequestParam("id") int id) {
		model.addAttribute("productDetail", product.getProductByID(id));
		model.addAttribute("fourProduct", product.getDataFourProducts());
		return "user/viewProduct";
	}
	
}
