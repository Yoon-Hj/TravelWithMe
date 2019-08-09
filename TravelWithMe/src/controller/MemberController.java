package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("mypage.do")
	public ModelAndView mypage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String mid = (String)session.getAttribute("user");
		System.out.println("컨트롤러 왔다.");
		
		mav.addAllObjects(m_msvc.getMyInfo(mid));
		mav.addObject("myBoard", m_bsvc.getMyBoard(mid));
		
		
		
		return mav;
	}
}
