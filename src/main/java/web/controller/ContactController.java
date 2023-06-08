package web.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import web.bean.Mailer;



@Controller
public class ContactController {
	@Autowired
	private SessionFactory factory;
	@Autowired
//	JavaMailSender mailer;
	private Mailer mailer;
	
	@Autowired
	ServletContext context;
	
	
	@RequestMapping(value = "Contact" , method=RequestMethod.GET)
	public String contact(ModelMap model) {
		return "user/contact";
	}

	
	
	@RequestMapping(value="send", method=RequestMethod.POST)
	public String send(ModelMap model,
			@RequestParam(value="from",  required=false) String from,
			@RequestParam(value="subject" ,  required=false) String subject,
			@RequestParam(value="body" ,  required=false) String body){
		
		
		try {
			mailer.send(from, "tranvandu3802@gmail.com",subject,body);
			model.addAttribute("messageC","Gửi mail thành công!");
		} catch (Exception e) {
			model.addAttribute("messageC","Gửi mail thất bại!");
		}
		
		return "user/contact";
	}
	
}
