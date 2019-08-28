package controller;

import java.io.File;
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
import org.springframework.web.servlet.View;

import model.AccomBoard;
import model.Comments;
import model.GuideBoard;
import model.Guideschedule;
import model.Member;
import model.Policy;
import model.Register;
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
	public ModelAndView attTest(@RequestParam(defaultValue = "0") String type,
			@RequestParam(defaultValue="1") String page, String keyword,				// 키워드 검색
			@RequestParam(defaultValue="") String area, 								// 축제 검색
			String eventStartDate, @RequestParam(defaultValue="")String eventEndDate) {
		ModelAndView mav = new ModelAndView();
		
		if(type.equals("0")) {
		}else if(type.equals("1")) {
			mav.addAllObjects(b_bsvc.apiTest(page, keyword));
		}else if(type.equals("2")) {
			mav.addObject("eventStartDate", eventStartDate);
			mav.addObject("eventEndDate", eventEndDate);
			mav.addObject("area", area);
			mav.addAllObjects(b_bsvc.festivalSearch(page, area, eventStartDate, eventEndDate));
		}else if(type.equals("3")) {
			mav.addObject("area", area);
			mav.addAllObjects(b_bsvc.areaSearch(page, area));
		}
		
		mav.addObject("apiType", type);
		mav.setViewName("attractionInfo");
		
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
	public ModelAndView accomBoardList(HttpSession session, 
			@RequestParam(defaultValue="1") int page,
			@RequestParam(defaultValue="1") int type, @RequestParam(required=false) String keyword,
			@RequestParam(required=false) String sdate, @RequestParam(required=false) String fdate, 
			@RequestParam(required=false) String like)throws ParseException, UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();
		List<String> picklist = (List<String>) session.getAttribute("picklist");
		String bkind = "A";
		if(keyword!= null || sdate != null || fdate != null || like != null) {
			mav.addAllObjects(b_bsvc.getAccomSearchList(page, type, keyword, sdate, fdate, like));
		}else {
			mav.addAllObjects(b_bsvc.getBoardListByPage(page, bkind));
		}
		mav.addObject("recommList", b_bsvc.getAccomBoardList(picklist));
		mav.addObject("likeList", b_asvc.getLikecode());			
		mav.setViewName("accomBoardList");
		return mav;
	}

	
	@RequestMapping("readBoard.do")
	public ModelAndView readBoard(int bnum, String bkind,
			@RequestParam(defaultValue="1") int page,
			@RequestParam(defaultValue="1") int type, @RequestParam(required=false) String keyword,
			@RequestParam(required=false) String sdate, @RequestParam(required=false) String fdate, 
			@RequestParam(required=false) String like) throws Exception {
		b_bsvc.uprcnt(bnum);
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(b_bsvc.getBoardContent(bnum, bkind));
		mav.addObject("commentList", b_bsvc.readComment(bnum));
		mav.addObject("page", page);
		mav.addObject("type", type);
		mav.addObject("keyword", keyword);
		mav.addObject("sdate", sdate);
		mav.addObject("fdate", fdate);
		mav.addObject("like", like);
		if(bkind.equals("A")) {
			mav.setViewName("accomView");
		}else if(bkind.equals("G")) {
			mav.setViewName("guideView");
		}else if(bkind.equals("C")) {
			mav.setViewName("commView");
		}
		return mav;
	}
	
	@RequestMapping("getRList.do")
	public @ResponseBody List<Register> getRList(int bnum){
		return b_bsvc.getRegisterListByNum(bnum);
	}
	
	@RequestMapping("writeComment.do")
	public @ResponseBody int writeComment(HttpSession session, int bnum, String ccontent) throws Exception {
		String mid = (String) session.getAttribute("user");
		Comments c = new Comments();
		c.setMid(mid);
		c.setBnum(bnum);
		c.setCcontent(ccontent);
		return b_bsvc.writeComment(c);
	}
	
	@RequestMapping("writeRecomment.do")
	public @ResponseBody int writeRecomment(HttpSession session, int bnum, int cgrid, String ccontent) throws Exception {
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
	
	@RequestMapping("tryRegister.do")
	public @ResponseBody String tryRegister(String regId, int bnum, int nop, String mid) throws Exception {
		return b_bsvc.tryRegister(regId, bnum, nop, mid);
	}
	
	@RequestMapping("tryRegisterG.do")
	public @ResponseBody String tryRegisterG(String regId, int bnum, int nop, String mid) throws Exception {
		return b_bsvc.tryRegisterG(regId, bnum, nop, mid);
	}
	
	@RequestMapping("getRegistInfo.do")
	public @ResponseBody List<HashMap<String, Object>> getRegistInfo(int bnum) {
		return b_bsvc.getRegistInfo(bnum);
	}
	
	@RequestMapping("cancelRegister.do")
	public @ResponseBody void cancelRegister(String mid, int bnum) throws Exception {
		b_bsvc.cancelRegister(mid, bnum);
	}
	
	@RequestMapping("rejectRegister.do")
	public @ResponseBody void rejectRegister(int bnum, String rid, String id) throws Exception {
		b_bsvc.rejectRegister(bnum, rid, id);
	}
	
	@RequestMapping("deleteBoard.do")
	public String accomDeleteBoard(int bnum, String bkind) throws Exception {
		b_bsvc.deleteBoard(bnum);
		if(bkind.equals("A")) {
			return "redirect: accomBoardList.do";			
		}else{
			return "redirect: guideBoardList.do";						
		}
	}
	
	@RequestMapping("accomWriteForm.do")
	public ModelAndView accomWriteForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("likeList", b_asvc.getLikecode());
		mav.setViewName("accomWriteForm");
		return mav;
	}
	
	@RequestMapping("accomWrite.do")
	public @ResponseBody void accomWrite(
						HttpSession session, AccomBoard accomBoard,
						String JSPgstartdate, String JSPgfinishdate,
						String[] pcode, @RequestParam(required=false) String[] pvalue) throws Exception{

		b_bsvc.accomWrite(session, accomBoard, JSPgstartdate, JSPgfinishdate, pcode, pvalue);
	}
	
	//가이드 게시글 작성하기
	@RequestMapping("guideWrite.do")
	public @ResponseBody void guideWrite(
									HttpSession session,
									GuideBoard guideBoard,
									String JSPgstartdate, String JSPgfinishdate, String JSPgenddate,
									String[] pcode, @RequestParam(required=false) String[] pvalue,
									@RequestParam(name="photo",required=false) MultipartFile[] photo,
									String[] DAY1time,String[] DAY1place,
									String[] DAY2time,String[] DAY2place,
									String[] DAY3time,String[] DAY3place ) throws Exception{
		
		System.out.println("크기 : " + photo.length);
		for(MultipartFile p : photo) {
			System.out.println("getname : " + p.getName());
			System.out.println("getcontenttype : " + p.getContentType());
			System.out.println("getfilename : " + p.getOriginalFilename());
		}
		System.out.println("컨트롤러"+photo);
		b_bsvc.guideWrite(session,guideBoard,JSPgstartdate, JSPgfinishdate, JSPgenddate,
				pcode,pvalue,photo,DAY1time,DAY1place,DAY2time,DAY2place, DAY3time,DAY3place);
		
	}
	
	//가이드 게시글 목록보기
	@RequestMapping("guideBoardList.do")
	public ModelAndView guideBoardList(@RequestParam(defaultValue="1") int page,
			@RequestParam(defaultValue="1") int type, String keyword,
			String sdate,String fdate) throws ParseException {
		ModelAndView mav = new ModelAndView();
		String bkind = "G";
		if(keyword!= null || sdate != null || fdate != null) {
			mav.addAllObjects(b_bsvc.getGuideSearchList(page, type, keyword, sdate, fdate));			
		}else {
			mav.addAllObjects(b_bsvc.getBoardListByPage(page, bkind));			
		}
		mav.addObject("readCntList", b_bsvc.getGuideBoardList());
		mav.setViewName("guideBoardList");
		return mav;
	}
	
	//사진 화면에 출력하기
	@RequestMapping("download.do")
	public View download(String photopath) {
		String path= "C:/Temp/attach/";
		File attachFile = new File(path+photopath);
		View view =new DownloadView(attachFile);
		return view;
	}
	

	//커뮤니티 화면 출력
	@RequestMapping("commBoardList.do")
	public void commBoardList() {}
	
	@RequestMapping("mainSearch.do")
	public ModelAndView mainSearch(String keyword) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardList", b_bsvc.getBoardListByMainSearch(keyword));
		mav.setViewName("mainBoard");
		return mav;
	}

	@RequestMapping("getMyAccomRegisterSche.do")
	public @ResponseBody boolean getMyAccomRegisterSche(HttpSession session, String sdate, String fdate, String atime) {
		boolean result = false;
		if(!((String)session.getAttribute("user")).equals("")) {
			if(b_bsvc.getMyAccomRegisterSche(session,sdate,fdate,atime).size()==0) {
				result = true;
			}
		}
		
		return result;
	}

	@RequestMapping("myBoards.do")
	public ModelAndView myBoards(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String mid = (String)session.getAttribute("user");
		for(HashMap<String, Object> a : (List<HashMap<String, Object>>)b_bsvc.getMyBoards(mid)) {
			System.out.println("잘 되녀ㅑ : " + a);
		}
		mav.addObject("boardList", b_bsvc.getMyBoards(mid));
		mav.setViewName("myBoards");
		return mav;
	}
}
