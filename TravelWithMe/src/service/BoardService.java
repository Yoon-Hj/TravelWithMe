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
	
	
	// 키워드 검색
	public HashMap<String, Object> apiTest(String pageNo, String keyword){
		return API.totalSearch(pageNo, keyword);
	}
	//축제검색
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
}
