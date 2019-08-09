package dao;

import java.util.HashMap;
import java.util.List;

import model.AccomBoard;
import model.Comments;
import model.CommuBoard;
import model.GuideBoard;
import model.Guideschedule;

public interface IBoardDao {

	public List<HashMap<String, Object>> selectBoardById(String mid);
	
	//동행게시글에서 사용하는 DAO
	public List<AccomBoard> selectAccomListByLike(String likecode);
	public AccomBoard selectOneAccom(int bnum);
	public void insertBoard(AccomBoard accomboard);
	public void insertAccom(AccomBoard accomboard);
	public void updateBoard(AccomBoard accomboard);
	public void updateAccom(AccomBoard accomboard);
	
	//가이드게시글에서 사용하는 DAO
	public List<GuideBoard> selectGuideListByRcnt();
	public GuideBoard selectOneGuide(int bnum);
	public List<String> selectAllPhotoByBnum(int bnum);
	public List<Guideschedule> selectGScheByBnum(int bnum);
	public void insertBoard(GuideBoard guideboard);
	public void insertGuide(GuideBoard guideboard);
	public void insertGuideSche(Guideschedule guidesche);
	public void insertPhoto(HashMap<String, Object> photo);
	public void updateBoard(GuideBoard guideboard);
	public void updateGuide(GuideBoard guideboard);
	public void deleteGuideSche(String scode);
	
	//커뮤니티게시글에서 사용한는 DAO
	public CommuBoard selectOneComm(int bnum);
	public void insertBoard(CommuBoard commuboard);
	public void insertComm(CommuBoard commuboard);
	public void updateBoard(CommuBoard commuboard);
	public void updateComm(CommuBoard commuboard);

	//게시글에서 공동으로 사용하는 DAO
	public HashMap<String, Object> selectPolicyByBnum(int bnum);
	public List<Comments> selectCommentList(int bnum);
	public List<HashMap<String, Object>> selectRegisterListByBnum(int bnum);
	public void deleteBoard(int bnum);
	public int getPossibleNop(int bnum);
	public void insertRegister(HashMap<String,Object> register);
	public void deleteRegister(String rid);
	public void insertComment(Comments comments);
	public void insertRecomment(Comments comments);
	public void deleteComment(int cnum);
	public void insertPolicy(HashMap<String, Object> policy);
	public void deletePolicy(int bnum);
	public int getBoardCount(String bkind);
}
