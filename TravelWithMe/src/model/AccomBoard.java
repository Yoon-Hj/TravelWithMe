package model;

import java.util.Date;

public class AccomBoard {
	//board
	private int bnum;
	private String bkind;
	private String mid;
	private Date bwritedate;
	private String btitle;
	private String bcontent;
	private int breadcount;
	private int cdel;
	//accompany
	private String aarea;
	private Date astartdate;
	private Date afinishdate;
	private String atime;
	private String adepartplace;
	private String adeparttime;
	private int anop;
	private String likecode;
	private String atransport;
	private String acourse;
	
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
	public String getAarea() {
		return aarea;
	}
	public void setAarea(String aarea) {
		this.aarea = aarea;
	}
	public Date getAstartdate() {
		return astartdate;
	}
	public void setAstartdate(Date astartdate) {
		this.astartdate = astartdate;
	}
	public Date getAfinishdate() {
		return afinishdate;
	}
	public void setAfinishdate(Date afinishdate) {
		this.afinishdate = afinishdate;
	}
	public String getAtime() {
		return atime;
	}
	public void setAtime(String atime) {
		this.atime = atime;
	}
	public String getAdepartplace() {
		return adepartplace;
	}
	public void setAdepartplace(String adepartplace) {
		this.adepartplace = adepartplace;
	}
	public String getAdeparttime() {
		return adeparttime;
	}
	public void setAdeparttime(String adeparttime) {
		this.adeparttime = adeparttime;
	}
	public int getAnop() {
		return anop;
	}
	public void setAnop(int anop) {
		this.anop = anop;
	}
	public String getLikecode() {
		return likecode;
	}
	public void setLikecode(String likecode) {
		this.likecode = likecode;
	}
	public String getAtransport() {
		return atransport;
	}
	public void setAtransport(String atransport) {
		this.atransport = atransport;
	}
	public String getAcourse() {
		return acourse;
	}
	public void setAcourse(String acourse) {
		this.acourse = acourse;
	}
	@Override
	public String toString() {
		return "AccomBoard [bnum=" + bnum + ", bkind=" + bkind + ", mid=" + mid + ", bwritedate=" + bwritedate
				+ ", btitle=" + btitle + ", bcontent=" + bcontent + ", breadcount=" + breadcount + ", cdel=" + cdel
				+ ", aarea=" + aarea + ", astartdate=" + astartdate + ", afinishdate=" + afinishdate + ", atime="
				+ atime + ", adepartplace=" + adepartplace + ", adeparttime=" + adeparttime + ", anop=" + anop
				+ ", likecode=" + likecode + ", atransport=" + atransport + ", acourse=" + acourse + "]";
	}
	
}
