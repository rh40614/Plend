package three.people.vo;

public class SearchVO extends PagingVO {

	private String searchType;
	private String searchValue;
	private int role;

	public void calPaging(int total) {
		setTotal(total);
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage()-1, getCntPage());
		calcStartEnd(getNowPage()-1, getCntPerPage());
	}
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}
}
