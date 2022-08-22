package three.people.vo;

//	찜하기
public class HeartVO extends PlaceVO{
	
	private int hidx;
	private int uidx;
	private int pidx;
	private String like;
	
	
	public String getLike() {
		return like;
	}
	public void setLike(String like) {
		this.like = like;
	}
	public int getHidx() {
		return hidx;
	}
	public void setHidx(int hidx) {
		this.hidx = hidx;
	}
	public int getUidx() {
		return uidx;
	}
	public void setUidx(int uidx) {
		this.uidx = uidx;
	}
	public int getPidx() {
		return pidx;
	}
	public void setPidx(int pidx) {
		this.pidx = pidx;
	}
	
	
	
}
