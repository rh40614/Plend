package three.people.vo;

public class InquiryVO extends UserVO {

	private int iqidx;
	private String category;
	private String title;
	private String content;
	private String date;
	private String img;
	private String answerYN;
	private int originiqidx;
	private int depth;
	private float answerRate; // 답변 만족도
	private int uidx;
	// rownum
	private int rnum;
	
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getUidx() {
		return uidx;
	}
	public void setUidx(int uidx) {
		this.uidx = uidx;
	}
	public int getIqidx() {
		return iqidx;
	}
	public void setIqidx(int iqidx) {
		this.iqidx = iqidx;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getAnswerYN() {
		return answerYN;
	}
	public void setAnswerYN(String answerYN) {
		this.answerYN = answerYN;
	}
	public int getOriginiqidx() {
		return originiqidx;
	}
	public void setOriginiqidx(int originiqidx) {
		this.originiqidx = originiqidx;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public float getAnswerRate() {
		return answerRate;
	}
	public void setAnswerRate(float answerRate) {
		this.answerRate = answerRate;
	}
	
	
}
