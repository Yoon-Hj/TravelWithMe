package model;

import java.util.Date;

public class CommuBoard {
	//board
	private int bnum;
	private String bkind;
	private String mid;
	private Date bwritedate;
	private String btitle;
	private String bcontent;
	private int breadcount;
	private int cdel;
	//community
	private String commukind;
	
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getBkind() {
		return bkind;
	}
	public void setBkind(String bkind) {
		this.bkind = bkind;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public Date getBwritedate() {
		return bwritedate;
	}
	public void setBwritedate(Date bwritedate) {
		this.bwritedate = bwritedate;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public int getBreadcount() {
		return breadcount;
	}
	public void setBreadcount(int breadcount) {
		this.breadcount = breadcount;
	}
	public int getCdel() {
		return cdel;
	}
	public void setCdel(int cdel) {
		this.cdel = cdel;
	}
	public String getCommukind() {
		return commukind;
	}
	public void setCommukind(String commukind) {
		this.commukind = commukind;
	}
	@Override
	public String toString() {
		return "CommuBoard [bnum=" + bnum + ", bkind=" + bkind + ", mid=" + mid + ", bwritedate=" + bwritedate
				+ ", btitle=" + btitle + ", bcontent=" + bcontent + ", breadcount=" + breadcount + ", cdel=" + cdel
				+ ", commukind=" + commukind + "]";
	}
	
	
}
