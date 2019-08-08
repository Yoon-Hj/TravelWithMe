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
}
