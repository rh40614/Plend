package three.people.vo;

public class BlockVO extends UserVO {

	private int rbidx;
	private String category;
	private String content;
	private String date; 
	private String bdelYN;
	private int reporter_uidx;
	private int respondent_uidx;
	// rownum
	private int rnum;
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getBdelYN() {
		return bdelYN;
	}
	public void setBdelYN(String bdelYN) {
		this.bdelYN = bdelYN;
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
	
	public int getReporter_uidx() {
		return reporter_uidx;
	}
	public void setReporter_uidx(int reporter_uidx) {
		this.reporter_uidx = reporter_uidx;
	}
	public int getRespondent_uidx() {
		return respondent_uidx;
	}
	public void setRespondent_uidx(int respondent_uidx) {
		this.respondent_uidx = respondent_uidx;
	}
	
	
}
