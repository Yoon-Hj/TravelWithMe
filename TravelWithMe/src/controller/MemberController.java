package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import service.AdminService;
import service.BoardService;
import service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService m_msvc;
	@Autowired
	private BoardService m_bsvc;
	@Autowired
	private AdminService m_asvc;
	
	
	
	
	
	
	
	
	
	@RequestMapping("mypage.do")
	public void mypage(HttpSession session) {
		String mid = (String)session.getAttribute("user");
		System.out.println("컨트롤러 왔다.");
		m_msvc.getMyInfo(mid);
		m_bsvc.getMyBoard(mid);
		System.out.println("테스트 서비스로 들어간다.");
		mid = "admin";
		m_msvc.testMethod(mid);
	}
}
