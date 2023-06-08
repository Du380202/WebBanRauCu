package web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import web.dao.ProductDao;

@Controller
public class SearchController {

	@Autowired
	private ProductDao productDao;
	@RequestMapping(value = "search" , method=RequestMethod.POST)
	public String timKiem(ModelMap model, 
					@RequestParam(value="keyword", required=false) String keyword) {
		
		model.addAttribute("searchKey", productDao.getDataByKeyWord(keyword));
		model.addAttribute("thongBao", "Sản phẩm trùng khớp với từ khóa " + keyword);
		return "user/search";
	}
	
}
