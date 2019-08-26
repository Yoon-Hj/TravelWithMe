package service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.IAdminDao;
import dao.IBoardDao;
import dao.IMemberDao;
import model.GuideRating;
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
	
	public void deleteThema(String likecode) throws Exception {
		try {
			a_adao.updatePreferOff(likecode);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw new Exception();
		}
	}
	
	public void addThema(String likename) throws Exception {
		try {
			HashMap<String, Object> params = new HashMap<String, Object>();
			
			String likecode = a_adao.selectLikecodeByName(likename);
			
			if(likecode == null) {
				params.put("likename", likename);
				params.put("likecode", 0);
				a_adao.insertPrefer(params);
			}else 
				a_adao.updatePreferOn(likecode);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw new Exception();
		}
	}
	
	public List<GuideRating> getGuideGrade(){
		return a_adao.selectAllGuiderating();
	}
	
	public void modifyGuideRating(String gmin, String smax, String smin, String bmax) throws Exception {
		try {
			int gMinpoint = Integer.parseInt(gmin);
			int sMaxpoint = Integer.parseInt(smax);
			int sMinpoint = Integer.parseInt(smin);
			int bMaxpoint = Integer.parseInt(bmax);
			GuideRating g = new GuideRating();
			
			g.setGrade("Gold");
			g.setMaxpoint(9999);
			g.setMinpoint(gMinpoint);
			a_adao.updateGuideRatingByGrade(g);
			
			g.setGrade("Silver");
			g.setMaxpoint(sMaxpoint);
			g.setMinpoint(sMinpoint);
			a_adao.updateGuideRatingByGrade(g);
			
			g.setGrade("Bronze");
			g.setMaxpoint(bMaxpoint);
			g.setMinpoint(0);
			a_adao.updateGuideRatingByGrade(g);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw new Exception();
		}
	}
	
}
