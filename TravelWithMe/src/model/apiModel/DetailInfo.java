package model.apiModel;

public class DetailInfo {
	// detailInfo
	private String fldgubun; // 일련번호.. 일단 필요없어보임..
	private String infoname; // 정보 제목
	private String infotext; // 정보 내용
	private String serialnum; // 반복 일련번호 : 정보의 순서.. 일단 가지고있어봄..
	
	public String getFldgubun() {
		return fldgubun;
	}
	public void setFldgubun(String fldgubun) {
		this.fldgubun = fldgubun;
	}
	public String getInfoname() {
		return infoname;
	}
	public void setInfoname(String infoname) {
		this.infoname = infoname;
	}
	public String getInfotext() {
		return infotext;
	}
	public void setInfotext(String infotext) {
		this.infotext = infotext;
	}
	public String getSerialnum() {
		return serialnum;
	}
	public void setSerialnum(String serialnum) {
		this.serialnum = serialnum;
	}
	
	@Override
	public String toString() {
		return "DetailInfo [fldgubun=" + fldgubun + ", infoname=" + infoname + ", infotext=" + infotext + ", serialnum="
				+ serialnum + "]";
	}
}
