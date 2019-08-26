package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.GuideRating;
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
	public String adminPage(Model model, HttpSession session, @RequestParam(defaultValue = "0") String type) {
		String user = (String)session.getAttribute("user");
		if(user != null) {
			if(!user.equals("admin")) {
				return "index";
			}else {
				model.addAttribute("type", type);
				return "adminPage";
			}
		}else
			return "index";
	}
	
	@RequestMapping("getGuidegrades.do")
	public @ResponseBody List<GuideRating> getGuidegrades(){
		System.out.println(a_asvc.getGuideGrade());
		return a_asvc.getGuideGrade();
	}
	
	@RequestMapping("getThemas.do")
	public @ResponseBody List<Preference> getThemas() {
//		System.out.println(a_asvc.getLikecode());
		return a_asvc.getLikecode();
	}
	
	@RequestMapping("deleteThema.do")
	public void deleteThema(String likecode) throws Exception {
		System.out.println("컨트롤러임");
		a_asvc.deleteThema(likecode);
		System.out.println("서비스갔다왔음");
	}
	
	@RequestMapping("addThema.do")
	public void addThema(String likename) throws Exception {
		System.out.println(likename);
		a_asvc.addThema(likename);
	}
	
	@RequestMapping("modifyGuideRating.do")
	public void modifyGuideRating(String gmin, String smax,
			String smin, String bmax) throws Exception {
		System.out.println(9999 + "  " + gmin);
		System.out.println(smax + "  " + smin);
		System.out.println(bmax + "  " + 0);
		a_asvc.modifyGuideRating(gmin, smax, smin, bmax);
	}
}
