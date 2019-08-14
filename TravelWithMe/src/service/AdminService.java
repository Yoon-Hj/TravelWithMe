package service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.IAdminDao;
import dao.IBoardDao;
import dao.IMemberDao;
import model.Preference;

@Service
public class AdminService {
	@Autowired
	private IMemberDao a_mdao;
	@Autowired
	private IBoardDao a_bdao;
	@Autowired
	private IAdminDao a_adao;
	
	public List<Preference> getLikecode() {
		return a_adao.selectLikeList();
	}
	
	
}
