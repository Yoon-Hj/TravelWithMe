package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Preference;
import service.AdminService;
import service.BoardService;
import service.MemberService;

@Controller
public class AdminController {
	@Autowired
	private MemberService a_msvc;
	@Autowired
	private BoardService a_bsvc;
	@Autowired
	private AdminService a_asvc;
	
	@RequestMapping("adminPage.do")
	public String adminPage(HttpSession session) {
		String user = (String)session.getAttribute("user");
		if(user != null) {
			if(!user.equals("admin")) {
				return "index";
			}else
				return "adminPage";
		}else
			return "index";
	}
	
	@RequestMapping("getGuidegrades.do")
	public void getGuidegrades(){
		
	}
	
	@RequestMapping("getThemas.do")
	public @ResponseBody List<Preference> getThemas() {
		System.out.println("? 옴?");
		System.out.println(a_asvc.getLikecode());
		return a_asvc.getLikecode();
	}
	
	
}
