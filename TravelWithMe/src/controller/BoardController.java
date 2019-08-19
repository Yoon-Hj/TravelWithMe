package controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import service.AdminService;
import service.BoardService;
import service.MemberService;

@Controller
public class BoardController {
	@Autowired
	private MemberService b_msvc;
	@Autowired
	private BoardService b_bsvc;
	@Autowired
	private AdminService b_asvc;
	
	
	
	
	@RequestMapping("attractionInfo.do")
	public void attractionInfo() {}
	
	@RequestMapping("apiKeywordSearch.do")
	public ModelAndView apiKeywordSearch(@RequestParam(defaultValue="1")String page, String keyword) {
		ModelAndView mav = new ModelAndView();
		
		mav.addAllObjects(b_bsvc.apiTest(page, keyword));
		mav.setViewName("keywordSearch");
		
		return mav;
	}
	
	@RequestMapping("festivalSearch.do")
	public ModelAndView festivalSearch(@RequestParam(defaultValue="1") String page,
			@RequestParam(defaultValue="") String area,
			String eventStartDate,
			@RequestParam(defaultValue="") String eventEndDate) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("eventStartDate", eventStartDate);
		mav.addObject("eventEndDate", eventEndDate);
		mav.addObject("area", area);
		mav.addAllObjects(b_bsvc.festivalSearch(page, area, eventStartDate, eventEndDate));
		mav.setViewName("festivalSearch");
		
		return mav;
	}
	
	@RequestMapping("apiAreaSearch.do")
	public ModelAndView apiAreaSearch(
			@RequestParam(defaultValue="1")String page,
			String areacode) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("selectedArea", areacode);
		mav.addAllObjects(b_bsvc.areaSearch(page, areacode));
		mav.setViewName("areaSearch");
		
		return mav;
	}
	
	@RequestMapping("viewDetail.do")
	public ModelAndView viewDetail(String contentid, String contenttypeid, String title) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("contenttypeid", contenttypeid);
		mav.addObject("title", title);
		mav.addAllObjects(b_bsvc.viewDetail(contentid, contenttypeid));
		mav.setViewName("viewDetail");
		
		return mav;
	}
	
	@RequestMapping("guideWriteForm.do")
	public void guideWriteForm() {}
	
	
	
	
	@RequestMapping("accomBoardList.do")
	public ModelAndView accomBoardList(HttpSession session, @RequestParam(defaultValue="1") int page) {
		ModelAndView mav = new ModelAndView();
		List<String> picklist = (List<String>) session.getAttribute("picklist");
		String bkind = "A";
		mav.addObject("recommList", b_bsvc.getAccomBoardList(picklist));
		mav.addAllObjects(b_bsvc.getBoardListByPage(page, bkind));
		mav.addObject("likeList", b_asvc.getLikecode());
		mav.setViewName("accomBoardList");
		return mav;
	}
}
