package controller;

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
	
	
	@RequestMapping(value = "checkId.do", method = RequestMethod.GET)
	public int checkId(@RequestParam("userId") String user_id) {
		return m_msvc.checkId(user_id);

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
