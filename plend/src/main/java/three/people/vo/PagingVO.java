package three.people.vo;

public class PagingVO {

	private int nowPage = 0; 
	private int startPage, endPage, total;
	private int cntPerPage = 0;
	private int lastPage, start, end;
	private int cntPage = 5;
	
	public void calcLastPage(int total, int cntPerPage) {
		setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
	}

	public void calcStartEndPage(int nowPage, int cntPage) {
		if(nowPage == 0) {
			setStartPage(1);
		}else {
			nowPage += 1;
			setStartPage(1+5*(((int)Math.ceil((double)nowPage/cntPage))-1));
		}
		
		setEndPage(getStartPage()-1 + cntPage);
		if(getLastPage() <= getEndPage()) {
			setEndPage(getLastPage());
		}
	}

	public void calcStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage * cntPerPage);
		setStart(nowPage*10);
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCntPerPage() {
		return cntPerPage;
	}

	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getCntPage() {
		return cntPage;
	}

	public void setCntPage(int cntPage) {
		this.cntPage = cntPage;
	}
	
	
}
