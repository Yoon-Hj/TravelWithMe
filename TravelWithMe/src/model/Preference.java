package model;

public class Preference {

	private String likecode;
	private String likes;
	private int likeon;
	
	public Preference(String likecode, String likes, int likeon) {
		super();
		this.likecode = likecode;
		this.likes = likes;
		this.likeon = likeon;
	}

	public String getLikecode() {
		return likecode;
	}

	public void setLikecode(String likecode) {
		this.likecode = likecode;
	}

	public String getLikes() {
		return likes;
	}

	public void setLikes(String likes) {
		this.likes = likes;
	}

	public int getLikeon() {
		return likeon;
	}

	public void setLikeon(int likeon) {
		this.likeon = likeon;
	}

	@Override
	public String toString() {
		return "Preference [likecode=" + likecode + ", likes=" + likes + ", likeon=" + likeon + "]";
	}
	
}
