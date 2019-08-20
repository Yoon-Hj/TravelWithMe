package model;

import java.util.Date;

public class Comments {
	
	private int cnum;
	private int cgrid;
	private int bnum;
	private String mid;
	private String ccontent;
	private Date cwritedate;
	private int cdel;
	
	@Override
	public String toString() {
		return "Comments [cnum=" + cnum + ", cgrid=" + cgrid + ", bnum=" + bnum + ", mid=" + mid + ", ccontent="
				+ ccontent + ", cwritedate=" + cwritedate + ", cdel=" + cdel + "]";
	}
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public int getCgrid() {
		return cgrid;
	}
	public void setCgrid(int cgrid) {
		this.cgrid = cgrid;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public Date getCwritedate() {
		return cwritedate;
	}
	public void setCwritedate(Date cwritedate) {
		this.cwritedate = cwritedate;
	}
	public int getCdel() {
		return cdel;
	}
	public void setCdel(int cdel) {
		this.cdel = cdel;
	}
	
}
