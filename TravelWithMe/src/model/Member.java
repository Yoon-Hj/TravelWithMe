package model;

import java.util.Date;

public class Member {
	private String mid;
	private String mpw;
	private String mname;
	private Date mbirth;
	private String mcontact;
	private String mgender;
	private int mpoint; 
	private int mguidepoint;
	
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public Date getMbirth() {
		return mbirth;
	}
	public void setMbirth(Date mbirth) {
		this.mbirth = mbirth;
	}
	public String getMcontact() {
		return mcontact;
	}
	public void setMcontact(String mcontact) {
		this.mcontact = mcontact;
	}
	public String getMgender() {
		return mgender;
	}
	public void setMgender(String mgender) {
		this.mgender = mgender;
	}
	public int getMpoint() {
		return mpoint;
	}
	public void setMpoint(int mpoint) {
		this.mpoint = mpoint;
	}
	public int getMguidepoint() {
		return mguidepoint;
	}
	public void setMguidepoint(int mguidepoint) {
		this.mguidepoint = mguidepoint;
	}
	
	@Override
	public String toString() {
		return "Member [mid=" + mid + ", mpw=" + mpw + ", mname=" + mname + ", mbirth=" + mbirth + ", mcontact="
				+ mcontact + ", mgender=" + mgender + ", mpoint=" + mpoint + ", mguidepoint=" + mguidepoint + "]";
	}
}
