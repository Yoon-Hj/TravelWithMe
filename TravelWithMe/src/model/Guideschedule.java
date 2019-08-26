package model;

import java.util.Date;

public class Guideschedule {
	
	private String scode;
	private int scode_output;
	private int bnum;
	private String sdate;
	private String stime;
	private String splace;
	
	
	@Override
	public String toString() {
		return "Guideschedule [scode=" + scode + ", bnum=" + bnum + ", sdate=" + sdate + ", stime=" + stime
				+ ", splace=" + splace + "]";
	}
	public String getScode() {
		return scode;
	}
	public void setScode(String scode) {
		this.scode = scode;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
	public String getSplace() {
		return splace;
	}
	public void setSplace(String splace) {
		this.splace = splace;
	}
	
	
	
}

	
