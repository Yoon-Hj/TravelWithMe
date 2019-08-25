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
	private String garea1;
	private String garea2;
	private String gtime;
	private Date gstartdate;
	private Date gfinishdate;
	private Date genddate;
	private java.sql.Date sqlGstartdate;
	private java.sql.Date sqlGfinishdate;
	private java.sql.Date sqlGenddate;
	private String gdepartplace;
	private String gdeparttime;
	private int gnop;
	private String gthema;
	private String photopath;
	
	@Override
	public String toString() {
		return "GuideBoard [bnum=" + bnum + ", bkind=" + bkind + ", mid=" + mid + ", bwritedate=" + bwritedate
				+ ", btitle=" + btitle + ", bcontent=" + bcontent + ", breadcount=" + breadcount + ", cdel=" + cdel
				+ ", garea=" + garea + ", garea1=" + garea1 + ", garea2=" + garea2 + ", gtime=" + gtime
				+ ", gstartdate=" + gstartdate + ", gfinishdate=" + gfinishdate + ", genddate=" + genddate
				+ ", sqlGstartdate=" + sqlGstartdate + ", sqlGfinishdate=" + sqlGfinishdate + ", sqlGenddate="
				+ sqlGenddate + ", gdepartplace=" + gdepartplace + ", gdeparttime=" + gdeparttime + ", gnop=" + gnop
				+ ", gthema=" + gthema + "]";
	}

	public String getPhotopath() {
		return photopath;
	}

	public void setPhotopath(String photopath) {
		this.photopath = photopath;
	}
	
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

	public String getGarea1() {
		return garea1;
	}

	public void setGarea1(String garea1) {
		this.garea1 = garea1;
	}

	public String getGarea2() {
		return garea2;
	}

	public void setGarea2(String garea2) {
		this.garea2 = garea2;
	}

	public String getGtime() {
		return gtime;
	}

	public void setGtime(String gtime) {
		this.gtime = gtime;
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

	public Date getGenddate() {
		return genddate;
	}

	public void setGenddate(Date genddate) {
		this.genddate = genddate;
	}

	public java.sql.Date getSqlGstartdate() {
		return sqlGstartdate;
	}

	public void setSqlGstartdate(java.sql.Date sqlGstartdate) {
		this.sqlGstartdate = sqlGstartdate;
	}

	public java.sql.Date getSqlGfinishdate() {
		return sqlGfinishdate;
	}

	public void setSqlGfinishdate(java.sql.Date sqlGfinishdate) {
		this.sqlGfinishdate = sqlGfinishdate;
	}

	public java.sql.Date getSqlGenddate() {
		return sqlGenddate;
	}

	public void setSqlGenddate(java.sql.Date sqlGenddate) {
		this.sqlGenddate = sqlGenddate;
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
	
	
	
}
