package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.IAdminDao;
import dao.IBoardDao;
import dao.IMemberDao;

@Service
public class AdminService {
	@Autowired
	private IMemberDao a_mdao;
	@Autowired
	private IBoardDao a_bdao;
	@Autowired
	private IAdminDao a_adao;
	
	
}
