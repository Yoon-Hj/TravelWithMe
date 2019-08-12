package controller;

import java.util.HashMap;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("headerTest.do")
	public void t() {}
	
	@RequestMapping("login_test.do")
	public void login_test(HttpSession session) {
		// 세션에 아이디 저장 테스트
		session.setAttribute("user", "test1");
		System.out.println("로그인으로 왔음");
		//return "headerTest";
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		System.out.println("로그아웃 한다.");
		System.out.println(session.getAttribute("user"));
		session.invalidate();
		return "headerTest";
	}
	
	
	@RequestMapping("mypage.do")
	public ModelAndView mypage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
//		String mid = (String)session.getAttribute("user");
		String mid = "test1234";
		System.out.println("컨트롤러 왔다.");
		
//		mav.addAllObjects(m_msvc.getMyInfo(mid));
//		mav.addObject("myBoard", m_bsvc.getMyBoard(mid));
		
		m_msvc.testMethod(mid);
		
		return mav;
	}
}
