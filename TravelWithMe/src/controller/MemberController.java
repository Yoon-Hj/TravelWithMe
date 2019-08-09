package controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping("join.do")
	public String join(@RequestParam HashMap<String, Object> params){
		/*
		 파라미터의 이름을 맵의 키값으로
		 파라미터의 value를 맵의 value로 설정한 맵 타입의 매개변수가 생김
		 */
//		System.out.println(params);
		m_msvc.joinMember(params);
		return "redirect:loginForm.do"; //리다이렉트 하는 방법
	}
	
	@RequestMapping("checkid.do")
	public String join(@RequestParam HashMap<String, Object> params){
		/*
		 파라미터의 이름을 맵의 키값으로
		 파라미터의 value를 맵의 value로 설정한 맵 타입의 매개변수가 생김
		 */
//		System.out.println(params);
		m_msvc.joinMember(params);
		return "redirect:loginForm.do"; //리다이렉트 하는 방법
	}
	
	
}
