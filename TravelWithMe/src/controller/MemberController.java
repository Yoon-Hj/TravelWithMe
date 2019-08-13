package controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	
	
	@RequestMapping("joinForm.do")
	public void joinForm() {}
	
	@RequestMapping(value = "checkId.do", method = RequestMethod.GET)
	public @ResponseBody String checkId(@RequestParam("id") String user_id) {
		
		return "" + m_msvc.checkId(user_id);

	}
	
    @RequestMapping("joinMember.do")
    public String joinMember(String user_id) {
		return null;
    	
    }
	
	
	@RequestMapping("hjTest.do")
	public void qw() {}
	
	@RequestMapping("headerTest.do")
	public void t() {}
	
	@RequestMapping("login.do")
	public @ResponseBody String login_test(HttpSession session,
			String mid, String mpw) {
		String val = null; 
		
		int result = m_msvc.login(mid, mpw);
		if(result == 1) {
			session.setAttribute("user", mid);
			val = mid;
		}else if(result == 2) {
			val = "2";
		}else if(result == 3)
			val = "3";
		
		return val;
	}
	
	@RequestMapping("logout.do")
	public void logout(HttpSession session) {
		System.out.println(session.getAttribute("user"));
		session.invalidate();
	}
	
	
	@RequestMapping("mypage.do")
	public ModelAndView mypage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
//		String mid = (String)session.getAttribute("user");
		String mid = "test1";
//		mav.addAllObjects(m_msvc.getMyInfo(mid));
//		mav.addObject("myBoard", m_bsvc.getMyBoard(mid));
		
		m_msvc.getMyInfo(mid);
		
		return mav;
	}
}
