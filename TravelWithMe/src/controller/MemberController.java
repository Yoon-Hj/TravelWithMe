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
import model.Register;
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
		HashMap<String, Object> resultMap = m_msvc.login(mid, mpw);
		int result = (int)resultMap.get("result");
		if(result == 1) {
			session.setAttribute("user", mid);
			session.setAttribute("picklist", resultMap.get("picklist"));
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
	
	@RequestMapping("getUserPoint.do")
	public @ResponseBody HashMap<String, Object> getUserPoint(String mid){
		return m_msvc.getUserPoint(mid);
	}
	
	@RequestMapping("withdrawalUser.do")
	public String withdrawalUser(HttpSession session) {
		String mid = (String)session.getAttribute("user");
		m_msvc.withdrawalUser(mid);
		session.invalidate();
		return "index";
	}
	
	@RequestMapping("myPage.do")
	public ModelAndView mypage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String mid = (String)session.getAttribute("user");
		
		mav.addAllObjects(m_msvc.getMyInfo(mid));
		mav.addObject("myBoard", m_bsvc.getMyBoard(mid));
//		for(HashMap<String, Object> a : (List<HashMap<String, Object>>)m_bsvc.getMyBoard(mid)) {
//			System.out.println("보드 : " + a);
//		}
		mav.setViewName("myPage");
		
		return mav;
	}
	
	@RequestMapping("checkPassword.do")
	public @ResponseBody String checkPassword(HttpSession session, String mpw) {
		String mid = (String)session.getAttribute("user");
		return m_msvc.checkPass(mid, mpw);
	}
	
	@RequestMapping("modifyPw.do")
	public void modifyPw(HttpSession session, String mpw) throws Exception {
		String mid = (String)session.getAttribute("user");
		m_msvc.modifyPw(mid, mpw);
	}
	
	@RequestMapping("modiMemInfo.do")
	public void modiMemInfo(HttpSession session, String mname, String mcontact) throws Exception {
		String mid = (String)session.getAttribute("user");
		m_msvc.modifyMemInfo(mid, mname, mcontact);
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
    public String joinMember(Member member, String mbirth2, String likecode[]) throws Exception {
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
	public ModelAndView joinForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String user = (String)session.getAttribute("user");
		if(user != null) {
			mav.addObject("codeList", m_asvc.getLikecode());
			mav.setViewName("joinForm");
			System.out.println(m_asvc.getLikecode());
		}else
			mav.setViewName("index");
		return mav;
		
		//여기서 넘겨 joinform.jsp로
	}
    
    @RequestMapping("evGuide.do")
    public void evGuide(String bnum, String gPoint, String nid) throws Exception {
    	System.out.println(bnum);
    	System.out.println(gPoint);
    	System.out.println("======================");
    	
    	m_msvc.addGuidePoint(bnum, gPoint, nid);
    	System.out.println("서비스 다녀왔음");
    }
    
    @ RequestMapping("readNotice.do")
    public void readNotice(String nid) {
    	m_msvc.readNotice(nid);
    }
    
    @RequestMapping("moreRegister.do")
    public @ResponseBody List<Register> moreRegister(HttpSession session) {
    	String mid = (String)session.getAttribute("user");
    	return m_msvc.getMoreRegister(mid);
    }
    
    @RequestMapping("getRegisterList.do")
    public @ResponseBody List<Register> getRegisterList(String bnum){
    	for(Register a : m_msvc.getRegisterList(bnum)) {
    		System.out.println("신청자 목록 : " + a);
    	}
    	return m_msvc.getRegisterList(bnum);
    }
    
    @RequestMapping("checkAttendance.do")
    public void checkAttendance(String[] attendance, String nid) throws Exception {
    	m_msvc.checkAttendance(attendance, nid);
    }
    
    @RequestMapping("findForm.do")
    public void findForm() {
		
		}
    
    @RequestMapping(value = "findID.do", method = RequestMethod.GET)
    public @ResponseBody String findID(@RequestParam("name") String findName1,@RequestParam("mail") String findMail1) {
	
    	Member member = new Member();
    	//System.out.println(findName1);
    	member.setMname(findName1);
    	member.setMcontact(findMail1);
    
    	String result = m_msvc.findId(member);
		System.out.println(m_msvc.findId(member));
		return result;
    	
      
		
    	
		}
   
   
	
    @RequestMapping(value="findPw.do", method = RequestMethod.GET)
    public @ResponseBody String findPW(@RequestParam("id") String id,@RequestParam("name") String name, @RequestParam("mail") String mail) {
		
    	Member member = new Member();
        member.setMid(id);
        member.setMname(name);
        member.setMcontact(mail);
    	String result = m_msvc.findPw(member);
    	
    	System.out.println(result);
    	
        return result;
    }
    
    @RequestMapping(value="repwd.do", method = RequestMethod.GET)
    public @ResponseBody void repwd(@RequestParam("pw") String pw, @RequestParam("id") String id) {
    Member member = new Member();
    member.setMpw(pw);
    member.setMid(id);
    m_msvc.repwd(member);
    
    }
}
