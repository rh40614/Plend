package three.people.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class EventVO {
	
	private int eidx;
	private String title;
	private String semiTitle;
	private String content;
	private String conditions;
	private String edate;
	private String startEnd;
	private MultipartFile[] eventImg;
	private String category;
	private String image;
	private String banner;
	// rownum
	private int rnum;
	private String delYN;
	
	
	public String getDelYN() {
		return delYN;
	}
	public void setDelYN(String delYN) {
		this.delYN = delYN;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public MultipartFile[] getEventImg() {
		return eventImg;
	}
	public void setEventImg(MultipartFile[] eventImg) {
		this.eventImg = eventImg;
	}
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getEidx() {
		return eidx;
	}
	public void setEidx(int eidx) {
		this.eidx = eidx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSemiTitle() {
		return semiTitle;
	}
	public void setSemiTitle(String semiTitle) {
		this.semiTitle = semiTitle;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getConditions() {
		return conditions;
	}
	public void setConditions(String conditions) {
		this.conditions = conditions;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public String getStartEnd() {
		return startEnd;
	}
	public void setStartEnd(String startEnd) {
		this.startEnd = startEnd;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getBanner() {
		return banner;
	}
	public void setBanner(String banner) {
		this.banner = banner;
	}

	
	
}
