package dao;

import java.util.HashMap;
import java.util.List;

import model.Notice;

public interface IMemberDao {

	public String selectPw(String mid);
	public List<String> selectLikecodeById(String mid);
	public HashMap<String, Object> selectMemPoint(String mid);
	public List<Notice> selectNoticeById(String mid);
	
}
