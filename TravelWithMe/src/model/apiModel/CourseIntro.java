package model.apiModel;

public class CourseIntro {
	private String distance;
	private String taketime;
	
	public String getDistance() {
		return distance;
	}
	public void setDistance(String distance) {
		this.distance = distance;
	}
	public String getTaketime() {
		return taketime;
	}
	public void setTaketime(String taketime) {
		this.taketime = taketime;
	}
	
	@Override
	public String toString() {
		return "CourseIntro [distance=" + distance + ", taketime=" + taketime + "]";
	}
}
