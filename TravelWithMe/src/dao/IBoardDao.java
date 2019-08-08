package dao;

import java.util.HashMap;
import java.util.List;

import model.AccomBoard;
import model.Comments;
import model.GuideBoard;

public interface IBoardDao {

	public List<HashMap<String, Object>> selectBoardById(String mid);
	
	//동행게시글에서 사용하는 DAO
	public List<AccomBoard> selectAccomListByLike(String likecode);
	public AccomBoard selectOneAccom(int bnum);
	
	//가이드게시글에서 사용하는 DAO
	public List<GuideBoard> selectGuideListByRcnt();

	//게시글에서 공동으로 사용하는 DAO
	public HashMap<String, Object> selectPolicyByBnum(int bnum);
	public List<Comments> selectCommentList(int bnum);
	public List<HashMap<String, Object>> selectRegisterListByBnum(int bnum);
	public int getPossibleNop(int bnum);
	public void insertRegister(HashMap<String,Object> params);
	public void deleteRegister(String rid);
	public void insertComment(Comments comments);
	public void insertRecomment(Comments comments);
	public void deleteComment(int cnum);
}
