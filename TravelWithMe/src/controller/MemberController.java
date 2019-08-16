package controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.Member;
import model.Notice;
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
	
	@RequestMapping("index.do")
	public void index() {}
	
	
	
	
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
	
	
	@RequestMapping("myPage.do")
	public ModelAndView mypage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String mid = (String)session.getAttribute("user");
		
		mav.addAllObjects(m_msvc.getMyInfo(mid));
		mav.addObject("myBoard", m_bsvc.getMyBoard(mid));
//		for(HashMap<String, Object> a : (List<HashMap<String, Object>>)m_bsvc.getMyBoard(mid)) {
//			System.out.println(a);
//		}
		mav.setViewName("myPage");
		
		return mav;
	}
	
	@RequestMapping("moreNotice.do")
	public @ResponseBody List<Notice> moreNotice(HttpSession session){
		String mid = (String)session.getAttribute("user");
		return m_msvc.getMoreNotice(mid);
	}
	
	
	@RequestMapping(value = "checkId.do", method = RequestMethod.GET)
	public @ResponseBody String checkId(@RequestParam("id") String user_id) {
		
		return "" + m_msvc.checkId(user_id);

	}
	
    @RequestMapping("joinMember.do")
    public String joinMember(Member member, String mbirth2, String likecode[]) {
//		System.out.println(member);
//		System.out.println(mbirth2);
//		System.out.println(likecode[0]);
//		System.out.println(likecode[1]);
//		System.out.println(likecode[2]);
     System.out.println(likecode);
  	  m_msvc.joinMember(member, likecode, mbirth2);
    	
  	  return "redirect:index.do";
    	
    }
    
    @RequestMapping("joinForm.do")
	public ModelAndView joinForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("codeList", m_asvc.getLikecode());
		mav.setViewName("joinForm");
		System.out.println(m_asvc.getLikecode());
		return mav;
		
		//여기서 넘겨 joinform.jsp로
	}
    
    @RequestMapping("evGuide.do")
    public void evGuide(HttpSession session, String bnum, String gPoint) throws Exception {
    	String mid = (String)session.getAttribute("user");
    	System.out.println(bnum);
    	System.out.println(gPoint);
    	System.out.println(mid);
    	System.out.println("======================");
//    	m_msvc.addGuidePoint("12", "4");
    	
    	m_msvc.addGuidePoint(bnum, gPoint, mid);
    	System.out.println("서비스 다녀왔음");
    }
    
    
}
