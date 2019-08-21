package controller;

import java.io.UnsupportedEncodingException;
import java.lang.ProcessBuilder.Redirect;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import model.Comments;
import model.GuideBoard;
import model.Guideschedule;
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
	public @ResponseBody int writeComment(HttpSession session, int bnum, String content) {
		String mid = (String) session.getAttribute("user");
		Comments c = new Comments();
		c.setMid(mid);
		c.setBnum(bnum);
		c.setCcontent(content);
		return b_bsvc.writeComment(c);
	}
	
	@RequestMapping("delComment.do")
	public @ResponseBody int delComment(int cnum) throws Exception {
		return b_bsvc.delComment(cnum);
	}
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("showGuidePreview.do")
	public @ResponseBody HashMap<String, Object> showGuidePreview(
									HttpSession session,
									GuideBoard guideBoard,
									String JSPgstartdate, String JSPgfinishdate, String JSPgenddate,
									String[] pcode, @RequestParam(required=false) String[] pvalue,
									@RequestParam(name="photo",required=false) MultipartFile[] photo,
									@RequestParam(required=false) String[] DAY1time,
									@RequestParam(required=false) String[] DAY2time,
									@RequestParam(required=false) String[] DAY3time,
									@RequestParam(required=false) String[] DAY1place,
									@RequestParam(required=false) String[] DAY2place,
									@RequestParam(required=false) String[] DAY3place ) throws ParseException{
		System.out.println("컨트롤러 연결");
		
		String writeId = (String)session.getAttribute("user");
		String garea = guideBoard.getGarea1() + " " + guideBoard.getGarea2();
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		Date togstartdate = (Date)fm.parse(JSPgstartdate);
		Date togfinishdate = (Date)fm.parse(JSPgfinishdate);
		Date togenddate = (Date)fm.parse(JSPgenddate);
		
		guideBoard.setMid(writeId);
		guideBoard.setGarea(garea);
		guideBoard.setGstartdate(togstartdate);
		guideBoard.setGfinishdate(togfinishdate);
		guideBoard.setGenddate(togenddate);
		guideBoard.setBkind("G");
		
		Policy policy = new Policy();
		for(int i = 0; i<pcode.length;i++) {
			policy.setPcode(Integer.parseInt(pcode[i]));
			if(pvalue.length!=0) {
				policy.setPvalue(Integer.parseInt(pvalue[i]));				
			}
		}
		
		Guideschedule guideSche1 = null;
		Guideschedule guideSche2 = null;
		Guideschedule guideSche3 = null;
		List<Guideschedule> DAY1guideScheList = new ArrayList<Guideschedule>();
		List<Guideschedule> DAY2guideScheList = new ArrayList<Guideschedule>();
		List<Guideschedule> DAY3guideScheList = new ArrayList<Guideschedule>();
		
		for(int i = 0; i<DAY1time.length;i++) {
			guideSche1 = new Guideschedule();
			guideSche1.setSdate("DAY1");
			guideSche1.setStime(DAY1time[i]);
			guideSche1.setSplace(DAY1place[i]);
			DAY1guideScheList.add(guideSche1);
		}
		if(DAY2time.length!=0) {
			System.out.println("2번 들어오니?");
			for(int i = 0; i<DAY2time.length;i++) {
				guideSche2 = new Guideschedule();
				guideSche2.setSdate("DAY2");
				guideSche2.setStime(DAY2time[i]);
				guideSche2.setSplace(DAY2place[i]);
				DAY2guideScheList.add(guideSche2);
			}
		}
		if(DAY3time.length!=0) {
			for(int i = 0; i<DAY3time.length;i++) {
				guideSche3 = new Guideschedule();
				guideSche3.setSdate("DAY3");
				guideSche3.setStime(DAY3time[i]);
				guideSche3.setSplace(DAY3place[i]);
				DAY3guideScheList.add(guideSche3);
			}
		}
		
		HashMap<Object, Object> photoModel = new HashMap<Object, Object>();
		if(photo.length!=0) {
			for(int i = 0; i<photo.length;i++) {
				photoModel.put(photo[i].getOriginalFilename(), i);
			}
		
		}

		int scheDay = 3;
		if(DAY3guideScheList==null)scheDay-=1;
		if(DAY2guideScheList==null)scheDay-=1;
		
		HashMap<String, Object> resultToPreview = new HashMap<String, Object>();
		resultToPreview.put("scheDay", scheDay);
		resultToPreview.put("guideBoard", guideBoard);
		resultToPreview.put("policy", policy);
		resultToPreview.put("photoModel", photoModel);
		if(scheDay==3) {
			resultToPreview.put("DAY1guideScheList", DAY1guideScheList);
			resultToPreview.put("DAY2guideScheList", DAY2guideScheList);
			resultToPreview.put("DAY3guideScheList", DAY3guideScheList);
		}else if(scheDay==2) {
			resultToPreview.put("DAY1guideScheList", DAY1guideScheList);
			resultToPreview.put("DAY2guideScheList", DAY2guideScheList);
		}else if(scheDay==1){
			resultToPreview.put("DAY1guideScheList", DAY1guideScheList);
		}
		
		System.out.println(guideBoard);
		System.out.println(policy);
		System.out.println(DAY1guideScheList);
		System.out.println(DAY2guideScheList);
		System.out.println(DAY3guideScheList);
		System.out.println(photoModel);
		
		return resultToPreview;

	}
}
