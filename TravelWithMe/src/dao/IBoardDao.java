package dao;

import java.util.HashMap;
import java.util.List;

import model.AccomBoard;
import model.Comments;
import model.CommuBoard;
import model.GuideBoard;
import model.Guideschedule;
import model.Policy;

public interface IBoardDao {

	public List<HashMap<String, Object>> selectBoardById(String mid);
	
	//동행게시글에서 사용하는 DAO
	public List<AccomBoard> selectAccomListByLike(String likecode);
	public AccomBoard selectOneAccom(int bnum);
	public void insertAccomBoard(AccomBoard accomboard);
	public void insertAccom(AccomBoard accomboard);
	public void updateAccomBoard(AccomBoard accomboard);
	public void updateAccom(AccomBoard accomboard);
	public List<AccomBoard> selectAccomListByPage(HashMap<String,Object> pagedata);
	public int getAccomCountByKeyword(HashMap<String, Object> param);
	public List<AccomBoard> selectAccomBoardByKeyword(HashMap<String, Object> param);
	
	//가이드게시글에서 사용하는 DAO
	public List<GuideBoard> selectGuideListByRcnt();
	public GuideBoard selectOneGuide(int bnum);
	public List<String> selectAllPhotoByBnum(int bnum);
	public List<Guideschedule> selectGScheByBnum(int bnum);
	public void insertGuideBoard(GuideBoard guideboard);
	public void insertGuide(GuideBoard guideboard);
	public void insertGuideSche(Guideschedule guidesche);
	public void insertPhoto(HashMap<String, Object> photo);
	public void updateGuideBoard(GuideBoard guideboard);
	public void updateGuide(GuideBoard guideboard);
	public void deleteGuideSche(String scode);
	public List<GuideBoard> selectGuideListByPage(HashMap<String,Object> pagedata);
	public int getGuideCountByKeyword(HashMap<String, Object> param);
	public List<GuideBoard> selectGuideBoardByKeyword(HashMap<String, Object> param);
  	
	//커뮤니티게시글에서 사용한는 DAO
	public CommuBoard selectOneComm(int bnum);
	public void insertCommBoard(CommuBoard commuboard);
	public void insertComm(CommuBoard commuboard);
	public void updateCommBoard(CommuBoard commuboard);
	public void updateComm(CommuBoard commuboard);
	public List<CommuBoard> selectCommListByPage(HashMap<String,Object> pagedata);
	public int getCommuCountByKeyword(HashMap<String, Object> param);
	public List<CommuBoard> selectCommuBoardByKeyword(HashMap<String, Object> param);

	//게시글에서 공동으로 사용하는 DAO
	public List<Policy> selectPolicyByBnum(int bnum);
	public List<Comments> selectCommentList(int bnum);
	public List<HashMap<String, Object>> selectRegisterListByBnum(int bnum);
	public void deleteBoard(int bnum);
	public int getPossibleNop(int bnum);
	public void insertRegister(HashMap<String, Object> register);
	public void deleteRegister(String rid);
	public int insertComment(Comments comments);
	public int insertRecomment(Comments comments);
	public int deleteComment(int cnum);
	public void insertPolicy(HashMap<String, Object> policy);
	public void deletePolicy(int bnum);
	public int getBoardCount(HashMap<String, Object> bkind);
	public List<HashMap<String, Object>> selectQuickSearch(String keyword);
	public void updateReadCount(int bnum);

	public int test();

}
