package service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.IBoardDao;
import dao.IMemberDao;

@Service
public class MemberService {
	@Autowired
	private IMemberDao m_mdao;
	@Autowired
	private IBoardDao m_bdao;
	
	public void joinMember(HashMap<String, Object> params) {
		if(params.get("pwd").equals(params.get("pwd_check"))) {
			dao.insertMember(params);
		}
	}
}
