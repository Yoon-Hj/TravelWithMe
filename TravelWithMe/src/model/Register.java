package model;

import java.util.Date;

public class Register {
	
	private String rid;
	private int bnum;
	private String mid;
	private Date rdate;
	private int rnop;
	private int attendstatus;
	private int evalstatus;
	
	public Register(String rid, int bnum, String mid, Date rdate, int rnop, int attendstatus, int evalstatus) {
		super();
		this.rid = rid;
		this.bnum = bnum;
		this.mid = mid;
		this.rdate = rdate;
		this.rnop = rnop;
		this.attendstatus = attendstatus;
		this.evalstatus = evalstatus;
	}

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

	public int getEvalstatus() {
		return evalstatus;
	}

	public void setEvalstatus(int evalstatus) {
		this.evalstatus = evalstatus;
	}

	@Override
	public String toString() {
		return "Register [rid=" + rid + ", bnum=" + bnum + ", mid=" + mid + ", rdate=" + rdate + ", rnop=" + rnop
				+ ", attendstatus=" + attendstatus + ", evalstatus=" + evalstatus + "]";
	}
	
}
