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
	public @ResponseBody HashMap<String, Object> moreNotice(HttpSession session){
		String mid = (String)session.getAttribute("user");
		
//		List<HashMap<String, String>> noticeList = m_msvc.getMoreNotice(mid);
//		List<JSONObject> json_noticeList = new ArrayList<JSONObject>();
//		for(int i = 0; i < noticeList.size(); i++) {
//			JSONObject q = new JSONObject();
//			q.put("nkcode", noticeList.get(i).get("NKCODE"));
//			q.put("nkreason", noticeList.get(i).get("NKREASON"));
//			json_noticeList.add(q);
//		}
//		
//		JSONObject w = new JSONObject();
//		w.put("result", json_noticeList);
//		System.out.println(w);
		HashMap<String, Object> a = new HashMap<String, Object>();
		m_msvc.getMoreNotice(mid);
//		System.out.println(qq.size());
		
//		a.put("result", qq);
//		a.put("result", "dddd");
//		ArrayList<HashMap<String, Object>> qqq = (ArrayList<HashMap<String,Object>>)qq;
		
		List<HashMap<String, Object>> d = new ArrayList<HashMap<String, Object>>();
		for(int i = 0; i < 4; i++) {
			HashMap<String, Object> www = new HashMap<String, Object>();
			www.put("a", "a");
			www.put("b", "b");
			d.add(www);
		}
		
		
		
		a.put("w", d);
//		a.put("qqq", qqq);
//		a.put("result", m_msvc.getMoreNotice(mid));
		
		
		System.out.println("이걸 보내긴 하ㅡㄴ거임");
		return a;
	}
	
	@RequestMapping("joinForm.do")
	public void joinForm() {}
	
	@RequestMapping(value = "checkId.do", method = RequestMethod.GET)
	public @ResponseBody String checkId(@RequestParam("id") String user_id) {
		
		return "" + m_msvc.checkId(user_id);

	}
	
    @RequestMapping("joinMember.do")
    public String joinMember(Member member, String mbirth2, String likecode[]) {
		//System.out.println(member);
		//System.out.println(mbirth2);
		//System.out.println(likecode[0]);
		//System.out.println(likecode[1]);
		//System.out.println(likecode[2]);
    	
//    	m_msvc.joinMember(member,likecode);
    	
    	return null;
    	
    }
}
