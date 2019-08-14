package model;

public class Preference {

	private String likecode;
	private String likename;
	private int likeon;
	
	public String getLikecode() {
		return likecode;
	}
	public void setLikecode(String likecode) {
		this.likecode = likecode;
	}
	public String getLikename() {
		return likename;
	}
	public void setLikename(String likename) {
		this.likename = likename;
	}
	public int getLikeon() {
		return likeon;
	}
	public void setLikeon(int likeon) {
		this.likeon = likeon;
	}
	@Override
	public String toString() {
		return "Preference [likecode=" + likecode + ", likename=" + likename + ", likeon=" + likeon + "]";
	}
}
