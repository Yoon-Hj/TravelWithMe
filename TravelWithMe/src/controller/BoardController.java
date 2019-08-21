package controller;

import java.io.UnsupportedEncodingException;
import java.lang.ProcessBuilder.Redirect;
import java.net.URLEncoder;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.Comments;
import model.Policy;
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
	
	
	
	@RequestMapping("attTest.do")
	public ModelAndView attTest(@RequestParam(defaultValue = "0") String type,
			@RequestParam(defaultValue="1") String page, String keyword,				// 키워드 검색
			@RequestParam(defaultValue="") String area, 								// 축제 검색
			String eventStartDate, @RequestParam(defaultValue="")String eventEndDate,	
			String areacode) {															// 지역 검색
		ModelAndView mav = new ModelAndView();
		
		if(type.equals("0")) {
			System.out.println("그냥 페이지로 이동함.");
		}else if(type.equals("1")) {
			mav.addAllObjects(b_bsvc.apiTest(page, keyword));
		}else if(type.equals("2")) {
			System.out.println("축제검색임");
		}else if(type.equals("3")) {
			System.out.println("지역 검색임");
		}
		
		
		mav.addObject("apiType", type);
		mav.setViewName("attractionInfo");
		
		return mav;
	}
	
	
	
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
	
	@RequestMapping("accomSearch.do")
	public ModelAndView accomSearch(@RequestParam(defaultValue="1") int page,
			@RequestParam(defaultValue="1") int type, @RequestParam(required=false) String keyword,
			@RequestParam(required=false) String sdate, @RequestParam(required=false) String fdate, 
			@RequestParam(required=false) String likecode) throws ParseException, UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(b_bsvc.getAccomSearchList(page, type, keyword, sdate, fdate, likecode));
		mav.addObject("keyword", URLEncoder.encode(keyword, "UTF-8"));
		mav.setViewName("accomBoardList");
		return mav;
	}
	
	@RequestMapping("readBoard.do")
	public ModelAndView readBoard(int bnum, String bkind) {
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(b_bsvc.getBoardContent(bnum, bkind));
		mav.addObject("commentList", b_bsvc.readComment(bnum));
		mav.addObject("registerList", b_bsvc.getRegisterListByNum(bnum));
		if(bkind.equals("A")) {
			mav.setViewName("accomView");
		}
		
		
		return mav;
	}
	
	@RequestMapping("writeComment.do")
	public @ResponseBody int writeComment(HttpSession session, int bnum, String ccontent) {
		String mid = (String) session.getAttribute("user");
		Comments c = new Comments();
		c.setMid(mid);
		c.setBnum(bnum);
		c.setCcontent(ccontent);
		return b_bsvc.writeComment(c);
	}
	
	@RequestMapping("writeRecomment.do")
	public @ResponseBody int writeRecomment(HttpSession session, int bnum, int cgrid, String ccontent) {
		System.out.println("와?");
		String mid = (String) session.getAttribute("user");
		Comments c = new Comments();
		c.setMid(mid);
		c.setBnum(bnum);
		c.setCgrid(cgrid);
		c.setCcontent(ccontent);
		return b_bsvc.writeRecomment(c);
	}
	
	@RequestMapping("delComment.do")
	public @ResponseBody int delComment(int cnum) throws Exception {
		return b_bsvc.delComment(cnum);
	}
}
