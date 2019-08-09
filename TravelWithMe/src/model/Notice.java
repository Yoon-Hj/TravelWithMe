package model;

import java.util.Date;

public class Notice {
	
	private String nid;
	private String nkcode;
	private int bnum;
	private String mid;
	private Date noticetime;
	private int noticestatus;
	
	public Notice(String nid, String nkcode, int bnum, String mid, Date noticetime, int noticestatus) {
		super();
		this.nid = nid;
		this.nkcode = nkcode;
		this.bnum = bnum;
		this.mid = mid;
		this.noticetime = noticetime;
		this.noticestatus = noticestatus;
	}

	public String getNid() {
		return nid;
	}

	public void setNid(String nid) {
		this.nid = nid;
	}

	public String getNkcode() {
		return nkcode;
	}

	public void setNkcode(String nkcode) {
		this.nkcode = nkcode;
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

	public Date getNoticetime() {
		return noticetime;
	}

	public void setNoticetime(Date noticetime) {
		this.noticetime = noticetime;
	}

	public int getNoticestatus() {
		return noticestatus;
	}

	public void setNoticestatus(int noticestatus) {
		this.noticestatus = noticestatus;
	}

	@Override
	public String toString() {
		return "notice [nid=" + nid + ", nkcode=" + nkcode + ", bnum=" + bnum + ", mid=" + mid + ", noticetime="
				+ noticetime + ", noticestatus=" + noticestatus + "]";
	}
	
}
