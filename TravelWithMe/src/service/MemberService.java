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




	public HashMap<String, Object> login(String mid, String mpw) {
		HashMap<String, Object> returnVal = new HashMap<String, Object>();
		
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
		
		returnVal.put("picklist", m_mdao.selectLikecodeById(mid));
		returnVal.put("result", result);
		return returnVal;
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
			System.out.println("알림 : " + a);
		}
		for(HashMap<String, String> r : (List<HashMap<String, String>>)returnVal.get("register")) {
			System.out.println("신청 : " + r);
		}
		
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

	//회원가입
	public void joinMember(Member member, String[] likecode, String mbirth2) throws Exception {
		// TODO Auto-generated method stub
		try {
			String  birth = mbirth2; // 형식을 지켜야 함
			java.sql.Date mbirth = java.sql.Date.valueOf(birth);
			member.setMbirth(mbirth);
			m_mdao.insertMember(member);
			String a = sha.sha256(member.getMpw());
			member.setMpw(a);
			m_mdao.insertUsedid(member.getMid());
			
			String id = null;
			String like = null;
			Mempick mempick = new Mempick(id,like);
			if(likecode != null) {
				for(String code : likecode){
					
					mempick.setMid(member.getMid());
					mempick.setLikecode(code);
					m_mdao.insertMempick(mempick);
				}
			}
			else if(likecode == null) {
				mempick.setMid(member.getMid());
				mempick.setLikecode("null");
				m_mdao.insertMempick(mempick);
				System.out.println(likecode);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw new Exception();
		}
	}
	

	public List<Notice> getMoreNotice(String mid){
		System.out.println("-----------------------------");
		for(Notice n : m_mdao.selectAllNoticeById(mid)) {
			System.out.println(n);
		}
		return m_mdao.selectAllNoticeById(mid);
	}
	
	public List<Register> getMoreRegister(String mid){
		System.out.println("-----------------------------");
		for(Register r : m_mdao.selectAllRegisterById(mid))
			System.out.println(r);
		return m_mdao.selectAllRegisterById(mid);
	}
	
	public List<Register> getRegisterList(String bnum){
		int parseBnum = Integer.parseInt(bnum);
		return m_mdao.selectRegisterByBnum(parseBnum);
	}

	public void addGuidePoint(String bnum, String gPoint, String nid) throws Exception {
		HashMap<String, Object> params = new HashMap<String, Object>();
		int parseBnum = Integer.parseInt(bnum);
		int parsePoint = Integer.parseInt(gPoint);
		
		System.out.println("서비스에서 포인트 값 : " + parsePoint);
		try {
			params.put("bnum", parseBnum);
			if(parsePoint >= 3 && parsePoint <= 5) {
				params.put("gpoint", parsePoint);
				m_mdao.updateGuidePoint(params);
			}
			System.out.println(nid);
			m_mdao.updateEvalStatus(nid);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw new Exception();
		}
	}

	public void readNotice(String nid) {
		m_mdao.updateNoticestatus(nid);
	}
	
	public void checkAttendance(String[] attendance, String nid) throws Exception {
		try {
			if(attendance != null) {
				for(int i = 0; i < attendance.length; i++) {
					m_mdao.updateAttendStatusByRid(attendance[i]);
				}
			}
			m_mdao.updateEvalStatus(nid);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw new Exception();
		}
	}

	public String findId(Member member) {
		

		String result = m_mdao.selectId(member);
		
		return result;
	}
	

	public String findPw(Member member) {
		
		String result = m_mdao.selectPw(member);
		return result;
		
	}

}
