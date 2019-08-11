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
	@Autowired
	private SHA256 sha;
	
	

	
	
	public void testMethod(String mid) {
		System.out.println("서비스에서 받은 mid : " + mid);
//		System.out.println(m_mdao.selectMemInfo(mid));
		System.out.println(sha.sha256(mid));
		
		System.out.println("서비스 종료한다.");
	}
	
	public HashMap<String, Object> getMyInfo(String mid) {
		HashMap<String, Object> returnVal = new HashMap<String, Object>();
		
		returnVal.put("memberInfo", m_mdao.selectMemInfo(mid));
		returnVal.put("notice", m_mdao.selectNoticeById(mid));
		returnVal.put("register", m_mdao.selectRegisterById(mid));
		
		return returnVal;

	}
}
