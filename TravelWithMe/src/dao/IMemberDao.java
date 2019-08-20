package dao;

import java.util.HashMap;
import java.util.List;

import model.Member;
import model.Mempick;
import model.Notice;
import model.Register;

public interface IMemberDao {
	
	//로그인
	public String selectPw(String mid);
	public List<String> selectLikecodeById(String mid);
	
	//아이디 호버
	public HashMap<String, Object> selectMemPoint(String mid);
	
	//마이페이지
	public Member selectMemInfo(String mid);
	public List<HashMap<String, String>> selectNoticeById(String mid);
	public List<HashMap<String, String>> selectRegisterById(String mid);
	
	//아이디, 비밀번호 찾기
	public String selectId(String id,String email);
	public String selectOneMem(HashMap<String, Object> params);
	public void updatePw(HashMap<String, Object> params);
	
	//회원가입
	public String selectOneId(String uid);
	public void insertMember(Member member);
	public void insertUsedid(String uid);
	public void insertMempick(Mempick mempick);
	
	//알림내역
	public List<Notice> selectAllNoticeById(String mid);
	public void insertNotice(Notice notice);
	
	//신청내역
	public List<Register> selectAllRegisterById(String mid);
	
	//작성자 연락처 조회
	public String selectContact(String mid);
	
	//게시글에 해당하는 신청자 리스트 조회
	public HashMap<String, Object> selectRegiMemInfo(int bnum);
	
	//회원정보 수정
	public void updateMember(Member member);
	
	//회원 탈퇴
	public void deleteMember(String mid);
	
	
	//회원 안읽은 알림수 구하기
	public int getMyNoticeCount(String mid);
	
	//가이드포인트 업데이트
	public void updateGuidePoint(HashMap<String, Object> params);
	//평가여부 업데이트
	public void updateEvalStatus(HashMap<String, Object> params);
	//알림 읽음
	public void updateNoticestatus(String nid);
	//신청자 목록 불러오기
	public List<Register> selectRegisterByBnum(int bnum);
	
}
