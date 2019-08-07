package model;

import java.util.Date;

public class GuideBoard {
	//board
	private int bnum;
	private String bkind;
	private String mid;
	private Date bwritedate;
	private String btitle;
	private String bcontent;
	private int breadcount;
	private int cdel;
	//guide
	private String garea;
	private Date gstartdate;
	private Date gfinishdate;
	private String gtime;
	private Date genddate;
	private String gdepartplace;
	private String gdeparttime;
	private int gnop;
	private String gthema;
	
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
	public String getGarea() {
		return garea;
	}
	public void setGarea(String garea) {
		this.garea = garea;
	}
	public Date getGstartdate() {
		return gstartdate;
	}
	public void setGstartdate(Date gstartdate) {
		this.gstartdate = gstartdate;
	}
	public Date getGfinishdate() {
		return gfinishdate;
	}
	public void setGfinishdate(Date gfinishdate) {
		this.gfinishdate = gfinishdate;
	}
	public String getGtime() {
		return gtime;
	}
	public void setGtime(String gtime) {
		this.gtime = gtime;
	}
	public Date getGenddate() {
		return genddate;
	}
	public void setGenddate(Date genddate) {
		this.genddate = genddate;
	}
	public String getGdepartplace() {
		return gdepartplace;
	}
	public void setGdepartplace(String gdepartplace) {
		this.gdepartplace = gdepartplace;
	}
	public String getGdeparttime() {
		return gdeparttime;
	}
	public void setGdeparttime(String gdeparttime) {
		this.gdeparttime = gdeparttime;
	}
	public int getGnop() {
		return gnop;
	}
	public void setGnop(int gnop) {
		this.gnop = gnop;
	}
	public String getGthema() {
		return gthema;
	}
	public void setGthema(String gthema) {
		this.gthema = gthema;
	}
	
	@Override
	public String toString() {
		return "GuideBoard [bnum=" + bnum + ", bkind=" + bkind + ", mid=" + mid + ", bwritedate=" + bwritedate
				+ ", btitle=" + btitle + ", bcontent=" + bcontent + ", breadcount=" + breadcount + ", cdel=" + cdel
				+ ", garea=" + garea + ", gstartdate=" + gstartdate + ", gfinishdate=" + gfinishdate + ", gtime="
				+ gtime + ", genddate=" + genddate + ", gdepartplace=" + gdepartplace + ", gdeparttime=" + gdeparttime
				+ ", gnop=" + gnop + ", gthema=" + gthema + "]";
	}
	
}
