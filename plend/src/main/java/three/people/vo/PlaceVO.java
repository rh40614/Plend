package three.people.vo;

import org.springframework.web.multipart.MultipartFile;

public class PlaceVO extends UserVO {

	private int pidx;
	private String category;
	private String placeName;
	private String title;
	private String eventYN;
	private String placeDetail;
	private String guide;
	private String tag;
	private String placeImg;
	private MultipartFile[] placeImgs;
	//2022.07.13 김연희: paddr->address
	private String address;
	private String option1;
	private String option2;
	private int price;
	private String delYN;
	private String approvalYN;
	private String intervalTime;
	//2022.07.14 김연희 : 시간 availTime으로 가지고 와서 availTimeValue로 정리해서 담음
	private String[] availTime;
	private String availTimeValue;
	private String useTime;
	private int cntPeople;
	//2022.08.08 김연희 : 페이징후 게시물 넘버
	private int rnum;
	//2022.08.10 김연희 : 평균 평점 
	private float avgRate;
	private int heart;
	
	
	
	public int getHeart() {
		return heart;
	}
	public void setHeart(int heart) {
		this.heart = heart;
	}
	public String getUseTime() {
		return useTime;
	}
	public void setUseTime(String useTime) {
		this.useTime = useTime;
	}
	public String getAvailTimeValue() {
		return availTimeValue;
	}
	public void setAvailTimeValue(String availTimeValue) {
		this.availTimeValue = availTimeValue;
	}
	public String getIntervalTime() {
		return intervalTime;
	}
	public void setIntervalTime(String intervalTime) {
		this.intervalTime = intervalTime;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public int getPidx() {
		return pidx;
	}
	public void setPidx(int pidx) {
		this.pidx = pidx;
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
	public String getEventYN() {
		return eventYN;
	}
	public void setEventYN(String eventYN) {
		this.eventYN = eventYN;
	}
	public String getPlaceDetail() {
		return placeDetail;
	}
	public void setPlaceDetail(String placeDetail) {
		this.placeDetail = placeDetail;
	}
	public String getGuide() {
		return guide;
	}
	public void setGuide(String guide) {
		this.guide = guide;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getPlaceImg() {
		return placeImg;
	}
	public void setPlaceImg(String placeImg) {
		this.placeImg = placeImg;
	}
	
	public String getOption1() {
		return option1;
	}
	public void setOption1(String option1) {
		this.option1 = option1;
	}
	public String getOption2() {
		return option2;
	}
	public void setOption2(String option2) {
		this.option2 = option2;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDelYN() {
		return delYN;
	}
	public void setDelYN(String delYN) {
		this.delYN = delYN;
	}
	public String getApprovalYN() {
		return approvalYN;
	}
	public void setApprovalYN(String approvalYN) {
		this.approvalYN = approvalYN;
	}
	public MultipartFile[] getPlaceImgs() {
		return placeImgs;
	}
	public void setPlaceImgs(MultipartFile[] placeImgs) {
		this.placeImgs = placeImgs;
	}
	public String getPlaceName() {
		return placeName;
	}
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	public String[] getAvailTime() {
		return availTime;
	}
	public void setAvailTime(String[] availTime) {
		this.availTime = availTime;
	}
	public int getCntPeople() {
		return cntPeople;
	}
	public void setCntPeople(int cntPeople) {
		this.cntPeople = cntPeople;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public float getAvgRate() {
		return avgRate;
	}
	public void setAvgRate(float avgRate) {
		this.avgRate = avgRate;
	}
	
	
	
}
