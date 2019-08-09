package dao;

import java.util.List;

import model.Preference;

public interface IAdminDao {

	//여행취향 리스트 조회
	public List<Preference> selectLikeList();
	
}
