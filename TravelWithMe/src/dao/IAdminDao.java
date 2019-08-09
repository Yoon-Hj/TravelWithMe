package dao;

import java.util.HashMap;
import java.util.List;

import model.Member;
import model.Preference;

public interface IAdminDao {

	//회원 관리
	public List<Member> searchId(String keyword);
	public void updateMemPoint(HashMap<String, Object> params);
	
	//여행취향 리스트 관리
	public List<Preference> selectLikeList();
	public void insertPrefer(Preference preference);
	public void updatePrefer(String likecode);
	
}
