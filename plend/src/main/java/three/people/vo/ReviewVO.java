package three.people.vo;

import org.springframework.web.multipart.MultipartFile;

public class ReviewVO extends BookVO {
	
	private int rvidx;
	private String title;
	private String content;
	private int rate;
	private String date;
	private String delYN;
	private int rnum;
	private MultipartFile[] reviewImgs;
	private String deleteImg;
	
	
	public String getDeleteImg() {
		return deleteImg;
	}
	public void setDeleteImg(String deleteImg) {
		this.deleteImg = deleteImg;
	}
	public MultipartFile[] getReviewImgs() {
		return reviewImgs;
	}
	public void setReviewImgs(MultipartFile[] reviewImgs) {
		this.reviewImgs = reviewImgs;
	}
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getRvidx() {
		return rvidx;
	}
	public void setRvidx(int rvidx) {
		this.rvidx = rvidx;
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
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	public String getDelYN() {
		return delYN;
	}
	public void setDelYN(String delYN) {
		this.delYN = delYN;
	}
	
	
}
