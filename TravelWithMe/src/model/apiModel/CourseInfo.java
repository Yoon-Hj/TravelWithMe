package model.apiModel;

public class CourseInfo {
	private String subcontentid;
	private String subdetailalt;
	private String subdetailimg;
	private String subdetailoverview;
	private String subname;
	private String subnum;
	
	public String getSubcontentid() {
		return subcontentid;
	}
	public void setSubcontentid(String subcontentid) {
		this.subcontentid = subcontentid;
	}
	public String getSubdetailalt() {
		return subdetailalt;
	}
	public void setSubdetailalt(String subdetailalt) {
		this.subdetailalt = subdetailalt;
	}
	public String getSubdetailimg() {
		return subdetailimg;
	}
	public void setSubdetailimg(String subdetailimg) {
		this.subdetailimg = subdetailimg;
	}
	public String getSubdetailoverview() {
		return subdetailoverview;
	}
	public void setSubdetailoverview(String subdetailoverview) {
		this.subdetailoverview = subdetailoverview;
	}
	public String getSubname() {
		return subname;
	}
	public void setSubname(String subname) {
		this.subname = subname;
	}
	public String getSubnum() {
		return subnum;
	}
	public void setSubnum(String subnum) {
		this.subnum = subnum;
	}
	
	@Override
	public String toString() {
		return "CourseInfo [subcontentid=" + subcontentid + ", subdetailalt=" + subdetailalt + ", subdetailimg="
				+ subdetailimg + ", subdetailoverview=" + subdetailoverview + ", subname=" + subname + ", subnum="
				+ subnum + "]";
	}
}
