package service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.IAdminDao;
import dao.IBoardDao;
import dao.IMemberDao;
import model.AccomBoard;
import model.Comments;
import model.Notice;
import model.Preference;

@Service
public class BoardService {
	@Autowired
	private IMemberDao b_mdao;
	@Autowired
	private IBoardDao b_bdao;
	@Autowired
	private IAdminDao b_adao;
	@Autowired
	private UseAPI API;
	

	
	
	
	
	
	
	
	
	public List<HashMap<String, Object>> getMyBoard(String mid) {
		return b_bdao.selectBoardById(mid);
	}
	
	
	//관광정보 키워드 검색
	public HashMap<String, Object> apiTest(String pageNo, String keyword){
		return API.totalSearch(pageNo, keyword);
	}
	// 축제검색
	public HashMap<String, Object> festivalSearch(String pageNo, String areaCode, 
			String eventStartDate, String eventEndDate) {
		return API.festivalSearch(pageNo, areaCode, eventStartDate, eventEndDate);
	}
	// 지역검색
	public HashMap<String, Object> areaSearch(String pageNo, String areacode){
		return API.areaSearch(pageNo, areacode);
	}
	// 상세정보
	public HashMap<String, Object> viewDetail(String contentid, String contenttypeid){
		return API.detailSearch(contentid, contenttypeid);
	}
	
	
	//페이징 처리
	public int getStartpage(int page) {
		return page - ((page-1) % 10);
	}
	public int getEndpage(int page, int cnt) {
		int startpage = getStartpage(page);
		int lastpage = getLastpage(cnt);
		if(lastpage - startpage >= 9)
			return getStartpage(page) + 9;
		else
			return lastpage;
	}
	public int getLastpage(int cnt) {
		// perpage : 한 페이지의 게시물 수
		int perpage = 8;
		if((cnt % perpage) == 0) return (cnt/perpage);
		else return (cnt/perpage) + 1;
	}
	public int getOffset(int page, int perpage) {
		return (page-1)*perpage + 1;
	}
	
	//페이징 데이터를 통해 게시물 리스트 가져오기
	public HashMap<String, Object> getBoardListByPage(int page,String bkind) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		int perpage = 8;
		int offset = getOffset(page, perpage);
		int cnt = 0;
		params.put("offset",offset);
		params.put("perpage", perpage);
		
		//bkind로 분기
		if(bkind.equals("A")) {
			
			params.put("bkind", 'A');
			cnt = b_bdao.getBoardCount(params);
			result.put("boardList", b_bdao.selectAccomListByPage(params));	
			
		}else if(bkind.equals("G")) {
			
			params.put("bkind", 'G');
			cnt = b_bdao.getBoardCount(params);
			result.put("boardList", b_bdao.selectGuideListByPage(params));
			
		}else if(bkind.equals("C")) {
			
			params.put("bkind", 'C');
			cnt = b_bdao.getBoardCount(params);
			result.put("boardList", b_bdao.selectCommListByPage(params));
		}
		
		result.put("current",page);
		result.put("start", getStartpage(page));
		result.put("end", getEndpage(page,cnt));
		result.put("last", getLastpage(cnt));
		result.put("totalBoard", cnt);
		return result;
	}
	
	
	
	
	//동행게시물 추천 4개 불러오기
	public List<AccomBoard> getAccomBoardList(List<String> picklist) {
		String likecode = null;
		if(picklist != null) {
			if(!picklist.isEmpty()) {
				double randomValue = Math.random();
				int ran = (int)(randomValue * picklist.size()) -1;
				likecode = picklist.get(ran);
			}
		}else {
			likecode = null;
		}
		return b_bdao.selectAccomListByLike(likecode);
	}
	
	//동행게시판으로 이동시 취향리스트 조회
	public List<Preference> getLikecode(){
		return b_adao.selectLikeList();
	}
	
	//동행게시판 검색
	public HashMap<String, Object> getAccomSearchList(int page, int type, String keyword, String sdate, String fdate, String likecode) throws ParseException {
		Date startdate = null;
		Date finishdate = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(sdate != null) startdate = sdf.parse(sdate);
		else if (fdate != null) finishdate = sdf.parse(fdate);
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("offset", getOffset(page, 8));
		params.put("perpage", 8);
		params.put("type", type);
		params.put("keyword", keyword);
		params.put("startdate", startdate);
		params.put("finishdate", finishdate);
		params.put("likecode", likecode);
		List<AccomBoard> alist = b_bdao.selectAccomBoardByKeyword(params);
		int cnt = b_bdao.getAccomCountByKeyword(params);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("type", type);
		result.put("keyword", keyword);
		result.put("startdate", startdate);
		result.put("finishdate", finishdate);
		result.put("likecode", likecode);
		result.put("current", page);
		result.put("asList", alist);
		result.put("start", getStartpage(page));
		result.put("end", getEndpage(page, cnt));
		result.put("last", getLastpage(cnt));
		result.put("totalBoard", cnt);
		return result;
	}
	
	//해당 게시물 조회수 증가
	public void uprcnt(int bnum) throws Exception {
		try {
			b_bdao.updateReadCount(bnum);
		}catch (Exception e) {
			e.printStackTrace();
			throw new Exception();
		}
		
	}
	
	//해당 게시글 내용 조회
	public HashMap<String, Object> getBoardContent(int bnum, String bkind) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		if(bkind.equals("A")) {
			result.put("accomBoard", b_bdao.selectOneAccom(bnum));
			result.put("policy", b_bdao.selectPolicyByBnum(bnum));
		}
		else if(bkind.equals("G")) {
			
		}
		else if(bkind.equals("C")) {
			
		}
		return result;
	}
	
	//해당 게시글의 댓글 조회
	public List<Comments> readComment(int bnum) {
		return b_bdao.selectCommentList(bnum);
	}
	
	//댓글 작성
	public int writeComment(Comments comments) throws Exception {
		int a = 0;
		try {
			a = b_bdao.insertComment(comments);
		}catch (Exception e){
			e.printStackTrace();
			throw new Exception();
		}
		return a;
	}
	
	//답글 작성
	public int writeRecomment(Comments comments) throws Exception {
		int a = 0;
		try {
			a = b_bdao.insertRecomment(comments);
		}catch (Exception e) {
			e.printStackTrace();
			throw new Exception();
		}
		return a;
	}
	
	//댓글 삭제
	public int delComment(int cnum) throws Exception {
		int a = 0;
		try {
			a = b_bdao.deleteComment(cnum); 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw new Exception();
		}
		return  a;
	}
	
	//해당 게시글의 신청내역 조회
	public List<HashMap<String, Object>> getRegisterListByNum(int bnum){
		return b_bdao.selectRegisterListByBnum(bnum);
	}
	
	//해당 게시글에 신청
	public String tryRegister(String regId, int nop, int bnum, String mid) {
		int pnum = b_bdao.getPossibleNop(bnum);
		if(pnum < nop) {
			return "모집 인원을 초과하여 신청이 불가합니다.";
		}else {
			HashMap<String, Object> r = new HashMap<String, Object>();
			r.put("bnum", bnum);
			r.put("regId", regId);
			r.put("nop", nop);
			b_bdao.insertRegister(r);
			//Notice n = new Notice();
			//n.setNkcode("R-1");
			//b_mdao.insertNotice(n);
			return b_mdao.selectContact(mid);
		}
	}
	
	
	//가이드 게시글 insert
	//public void guideWrite
	
}
