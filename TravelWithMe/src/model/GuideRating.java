package model;

public class GuideRating {
	private String grade;
	private int maxpoint;
	private int minpoint;
	
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getMaxpoint() {
		return maxpoint;
	}
	public void setMaxpoint(int maxpoint) {
		this.maxpoint = maxpoint;
	}
	public int getMinpoint() {
		return minpoint;
	}
	public void setMinpoint(int minpoint) {
		this.minpoint = minpoint;
	}
	
	@Override
	public String toString() {
		return "GuideRating [grade=" + grade + ", maxpoint=" + maxpoint + ", minpoint=" + minpoint + "]";
	}
}
