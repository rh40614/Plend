package three.people.vo;

public class QnaVO extends PlaceVO {
	private int qidx;
	private String title;
	private String content;
	private String date;
	private int originQidx = 0;
	private int depth;
	private String delYN;
	
	public int getQidx() {
		return qidx;
	}
	public void setQidx(int qidx) {
		this.qidx = qidx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public int getOriginQidx() {
		return originQidx;
	}
	public void setOriginQidx(int originQidx) {
		this.originQidx = originQidx;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public String getDelYN() {
		return delYN;
	}
	public void setDelYN(String delYN) {
		this.delYN = delYN;
	}
	
	
}
