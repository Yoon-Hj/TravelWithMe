package model;

public class Policy {
	
	private int bnum;
	private int pcode;
	private int pvalue;
	
	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}

	public int getPcode() {
		return pcode;
	}

	public void setPcode(int pcode) {
		this.pcode = pcode;
	}

	public int getPvalue() {
		return pvalue;
	}

	public void setPvalue(int pvalue) {
		this.pvalue = pvalue;
	}

	@Override
	public String toString() {
		return "Policy [bnum=" + bnum + ", pcode=" + pcode + ", pvalue=" + pvalue + "]";
	}
	
}
