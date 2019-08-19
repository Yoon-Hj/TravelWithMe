package model;

import java.util.Date;

public class Register {
	
	private String rid;
	private int bnum;
	private String mid;
	private Date rdate;
	private int rnop;
	private int attendstatus;
	// 윤현준이 추가한거
	private String bkind;
	private String btitle;
	
	public String getRid() {
		return rid;
	}
	public void setRid(String rid) {
		this.rid = rid;
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
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	public int getRnop() {
		return rnop;
	}
	public void setRnop(int rnop) {
		this.rnop = rnop;
	}
	public int getAttendstatus() {
		return attendstatus;
	}
	public void setAttendstatus(int attendstatus) {
		this.attendstatus = attendstatus;
	}
	public String getBkind() {
		return bkind;
	}
	public void setBkind(String bkind) {
		this.bkind = bkind;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	
	@Override
	public String toString() {
		return "Register [rid=" + rid + ", bnum=" + bnum + ", mid=" + mid + ", rdate=" + rdate + ", rnop=" + rnop
				+ ", attendstatus=" + attendstatus + ", bkind=" + bkind + ", btitle=" + btitle + "]";
	}
}
