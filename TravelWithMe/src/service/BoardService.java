package service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.IBoardDao;
import dao.IMemberDao;

@Service
public class BoardService {
	@Autowired
	private IMemberDao b_mdao;
	@Autowired
	private IBoardDao b_bdao;
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
	public HashMap<String, Object> getBoardListByPage(int page,int perpage,String bkind) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		HashMap<String, Object> result = new HashMap<String, Object>();
		
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
}
