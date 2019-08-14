package service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.IBoardDao;
import dao.IMemberDao;
import model.Member;
import model.Mempick;
import model.Notice;
import model.Register;

@Service
public class MemberService {
	@Autowired
	private IMemberDao m_mdao;
	@Autowired
	private IBoardDao m_bdao;
	@Autowired
	private SHA256 sha;




	public int login(String mid, String mpw) {
		//	암호화 적용 전,  암호화 적용후 지우고 아래부분 사용할 것
		String checkPw = m_mdao.selectPw(mid);
		int result = 2;		// 존재하지 않는 ID
		if(checkPw != null) {
			if(checkPw.equals(mpw)) {
				result = 1;	// 로그인 성공
			}else
				result = 3; // 아이디 또는 비밀번호 틀림
		}

		//	암호화 적용 후
		//		String checkPw = m_mdao.selectPw(mid);
		//		String input_pw = sha.sha256(mpw);
		//		int result = 2;		// 존재하지 않는 ID
		//		if(checkPw != null) {
		//			if(checkPw.equals(input_pw)) {
		//				result = 1;	// 로그인 성공
		//			}else
		//				result = 3; // 아이디 또는 비밀번호 틀림
		//		}
		return result;
	}

	public void testMethod(String mid) {
		System.out.println("서비스에서 받은 mid : " + mid);
		//		System.out.println(m_mdao.selectMemInfo(mid));
		System.out.println(sha.sha256(mid));
		System.out.println(sha.sha256("test1234"));
		System.out.println(sha.sha256("test12344"));

		System.out.println("서비스 종료한다.");
	}

	// 마이페이지 작업
	public HashMap<String, Object> getMyInfo(String mid) {
		HashMap<String, Object> returnVal = new HashMap<String, Object>();

		returnVal.put("memberInfo", m_mdao.selectMemInfo(mid));
		returnVal.put("notice", m_mdao.selectNoticeById(mid));
		returnVal.put("register", m_mdao.selectRegisterById(mid));

		//		System.out.println(returnVal.get("notice"));
		for(HashMap<String, String> a: (List<HashMap<String, String>>)returnVal.get("notice")) {
			System.out.println(a);
		}
		for(HashMap<String, String> r : (List<HashMap<String, String>>)returnVal.get("register")) {
			System.out.println(r);
		}

		//		for(HashMap<String, String> b: (List<HashMap<String, String>>)returnVal.get("register")) {
		//			System.out.println(b);
		//		}
		return returnVal;

	}
	public int checkId(String user_id) {

		int rev;
		if(m_mdao.selectOneId(user_id) == null) {
			rev=0;
		}
		else{rev=1;};

		return rev;

	}

	public List<Notice> getMoreNotice(String mid){
		return m_mdao.selectAllNoticeById(mid);
	}

	//	public void joinMember(Member member, String[] likecode) {
	//		// TODO Auto-generated method stub
	//
	//		HashMap<String, Object> pick = new HashMap<String, Object>();
	//
	//		for(String code : likecode){
	//
	//			pick.put("mid", member.getMid());
	//			pick.put("likecode", code);
	//			Mempick mempick = new Mempick(pick, code);
	//			mempick.setMid(mid);
	//			mempick.setLikecode(code);
	//			MemberDao.insertMempick(mempick);
	//		}



































}
