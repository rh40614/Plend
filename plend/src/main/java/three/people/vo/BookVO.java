package three.people.vo;

public class BookVO extends PlaceVO{

	private int bidx;
	private String bookTime;
	private String useTime;
	private int cntPeople;
	private String option1;
	private String reviewYN;
	private String approvalYN;
	private String delYN;
	private String successBook;
	private String rejectContent;
	//2022.08.08 김연희 : 페이징후 게시물 넘버
	private int rnum;
	private int totalPrice;
	
	
	
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getSuccessBook() {
		return successBook;
	}
	public void setSuccessBook(String successBook) {
		this.successBook = successBook;
	}
	public int getBidx() {
		return bidx;
	}
	public void setBidx(int bidx) {
		this.bidx = bidx;
	}
	public String getBookTime() {
		return bookTime;
	}
	public void setBookTime(String bookTime) {
		this.bookTime = bookTime;
	}
	public String getUseTime() {
		return useTime;
	}
	public void setUseTime(String useTime) {
		this.useTime = useTime;
	}
	public int getCntPeople() {
		return cntPeople;
	}
	public void setCntPeople(int cntPeople) {
		this.cntPeople = cntPeople;
	}
	public String getOption1() {
		return option1;
	}
	public void setOption1(String option1) {
		this.option1 = option1;
	}
	public String getReviewYN() {
		return reviewYN;
	}
	public void setReviewYN(String reviewYN) {
		this.reviewYN = reviewYN;
	}
	public String getApprovalYN() {
		return approvalYN;
	}
	public void setApprovalYN(String approvalYN) {
		this.approvalYN = approvalYN;
	}
	public String getDelYN() {
		return delYN;
	}
	public void setDelYN(String delYN) {
		this.delYN = delYN;
	}
	public String getRejectContent() {
		return rejectContent;
	}
	public void setRejectContent(String rejectContent) {
		this.rejectContent = rejectContent;
	}
	
	
}
