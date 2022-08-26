package three.people.service;

import java.util.HashMap;
import java.util.List;

import three.people.vo.BookVO;
import three.people.vo.IncomeVO;
import three.people.vo.PlaceVO;

public interface BookService {

	int insertBook(BookVO bookvo);
	int updateSuccess();
	List<BookVO> selectBookByHost(HashMap<String, Integer> page2);
	int cntBook(int uidx);
	int bookCancel(BookVO bookVO);
	List<BookVO> placeBookOne(PlaceVO placeVO);
	List<BookVO> disableUseTime(BookVO bookVO);
	/* int insertIncome(IncomeVO incomeVO); */
}
