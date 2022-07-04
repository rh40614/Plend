package three.people.vo;

public class BlockVO extends UserVO {
	
	private int rbidx;
	private int assort;
	private String category;
	private String content;
	private String date;
	private String delYN;
	
	public int getAssort() {
		return assort;
	}
	public void setAssort(int assort) {
		this.assort = assort;
	}
	public int getRbidx() {
		return rbidx;
	}
	public void setRbidx(int rbidx) {
		this.rbidx = rbidx;
	}

	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getDelYN() {
		return delYN;
	}
	public void setDelYN(String delYN) {
		this.delYN = delYN;
	}
	
	
}
