package controller;

import java.util.HashMap;

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
		System.out.println("컨트롤러 왔음");
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
		
		HashMap<String, Object> result = b_bsvc.festivalSearch(page, area, eventStartDate, eventEndDate);
		result.put("eventStartDate", eventStartDate);
		result.put("eventEndDate", eventEndDate);
		result.put("area", area);
		
		mav.addAllObjects(result);
		mav.setViewName("festivalSearch");
		
		return mav;
	}
	
	@RequestMapping("apiAreaSearch.do")
	public ModelAndView apiAreaSearch(
			@RequestParam(defaultValue="1")String page,
			String areacode) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> result = b_bsvc.areaSearch(page, areacode);
		result.put("selectedArea", areacode);
		
		mav.addAllObjects(result);
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
}
