package dao;

import java.util.HashMap;
import java.util.List;

import model.AccomBoard;
import model.Comments;
import model.GuideBoard;

public interface IBoardDao {

	public List<HashMap<String, Object>> selectBoardById(String mid);
	
	public List<AccomBoard> selectAccomListByLike(String likecode);
	
	public List<GuideBoard> selectGuideListByRcnt();
	
	public AccomBoard selectOneAccom(int bnum);
	public HashMap<String, Object> selectPolicyByBnum(int bnum);
	public List<Comments> selectCommentList(int bnum);
	public List<HashMap<String, Object>> selectRegisterListByBnum(int bnum);
	public int getPossibleNop(int bnum);
	public void insertRegister(int bnum, String regId,int nop);
}
