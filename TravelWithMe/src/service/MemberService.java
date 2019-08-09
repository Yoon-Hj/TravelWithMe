package service;

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
	
	
	
	public void testMethod(String mid) {
		System.out.println("서비스에서 받은 mid : " + mid);
		System.out.println(m_mdao.selectMemInfo(mid));
		System.out.println("서비스 종료한다.");
	}
	
	public void getMyInfo(String mid) {
//		m_mdao.selectMemInfo(mid);
//		m_mdao.selectNoticeById(mid);
//		m_mdao.selectRegisterById(mid);
		
		
	}
}
