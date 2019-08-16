package model;

import java.util.Date;

public class Notice {
	
	private String nid;
	private String nkcode;
	private int bnum;
	private String mid;
	private Date noticetime;
	private int noticestatus;
	
	// 윤현준이 추가한거.
	private String nkreason;
	private String btitle;
	private String bkind;
	private int evalstatus;	// 평가여부
	
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
	public String getNkreason() {
		return nkreason;
	}
	public void setNkreason(String nkreason) {
		this.nkreason = nkreason;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBkind() {
		return bkind;
	}
	public void setBkind(String bkind) {
		this.bkind = bkind;
	}
	public int getEvalstatus() {
		return evalstatus;
	}
	public void setEvalstatus(int evalstatus) {
		this.evalstatus = evalstatus;
	}
	@Override
	public String toString() {
		return "Notice [nid=" + nid + ", nkcode=" + nkcode + ", bnum=" + bnum + ", mid=" + mid + ", noticetime="
				+ noticetime + ", noticestatus=" + noticestatus + ", nkreason=" + nkreason + ", btitle=" + btitle
				+ ", bkind=" + bkind + ", evalstatus=" + evalstatus + "]";
	}
	
}
