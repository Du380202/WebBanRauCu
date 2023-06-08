package web.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;
import web.dao.*;
import web.entity.Categories;
import web.entity.Products;



@Controller
public class HomeController {
	@Autowired
	  public Categorys category;
	@Autowired
	private ProductDao productDao;
	
	@RequestMapping(value = {"/", "Home"})
	public String index(ModelMap model) {
		List<Products> products = productDao.getDataNew();
        model.addAttribute("productNew", products);
		return "user/index";
	}
	
	
	
	
	
}
