package model;

public class Mempick {
	
	private String mid;
	private String likecode;
	
	public Mempick(String mid, String likecode) {
		this.mid = mid;
		this.likecode = likecode;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getLikecode() {
		return likecode;
	}

	public void setLikecode(String likecode) {
		this.likecode = likecode;
	}

	@Override
	public String toString() {
		return "Mempick [mid=" + mid + ", likecode=" + likecode + "]";
	}
	
}
