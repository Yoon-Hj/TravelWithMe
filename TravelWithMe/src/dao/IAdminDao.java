package dao;

import java.util.HashMap;
import java.util.List;

import model.GuideRating;
import model.Member;
import model.Preference;

public interface IAdminDao {

	//회원 관리
	public List<Member> searchId(String keyword);
	public void updateMemPoint(HashMap<String, Object> params);
	
	//여행취향 리스트 관리
	public List<Preference> selectLikeList();
	public void insertPrefer(HashMap<String, Object> params);
	public void updatePreferOn(String likecode);
	public void updatePreferOff(String likecode);
	public String selectLikecodeByName(String likename);
	
	//가이드 등급관리
	public List<GuideRating> selectAllGuiderating();
	public void updateGuideRatingByGrade(GuideRating g);
}
