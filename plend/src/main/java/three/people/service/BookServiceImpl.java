package three.people.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import three.people.dao.BookDAO;
import three.people.vo.BookVO;
import three.people.vo.IncomeVO;
import three.people.vo.PlaceVO;
import three.people.vo.UserVO;

@Service
public class BookServiceImpl implements BookService {
	
	@Autowired
	BookDAO bookDAO;
	
	@Override
	public int insertBook(BookVO bookvo) {
		return bookDAO.insertBook(bookvo);
	}

	@Override
	public int updateSuccess() {
		List<BookVO> bookList = useTimeEnd();
		int result = 0;
		calcIncome(bookList);
		result = successBookUpdateY(bookList);
		return result;
	}
	
	public List<BookVO> useTimeEnd(){
		return bookDAO.usetimeEnd();
	}
	public void calcIncome(List<BookVO> bookList) {
		IncomeVO incomeVO = new IncomeVO();
		for(BookVO book : bookList) {
			incomeVO.setTotalIncome(book.getTotalPrice());
			incomeVO.setTotalPeople(book.getCntPeople());
			incomeVO.setUidx(book.getUidx());
			insertIncome(incomeVO);
		}
	}
	@Override
	public int insertIncome(IncomeVO incomeVO) {
		return bookDAO.insertIncome(incomeVO);
	}
	public int successBookUpdateY(List<BookVO> bookList) {
		int result = 0;
		for(BookVO book : bookList) {
			result = bookDAO.successBook(book);
		}
		return result;
	}
	
	@Override
	public List<BookVO> selectBookByHost(HashMap<String, Integer> page2) {
		return bookDAO.selectBookByHost(page2);
	}

	@Override
	public int cntBook(int uidx) {
		return bookDAO.cntBook(uidx);
	}

	@Override
	public int bookCancel(BookVO bookVO) {
		return bookDAO.bookCancel(bookVO);
	}

	@Override
	public List<BookVO> placeBookOne(PlaceVO placeVO) {
		return bookDAO.placeBookOne(placeVO);
	}

	@Override
	public List<BookVO> disableUseTime(BookVO bookVO) {
		return bookDAO.disableUseTime(bookVO);
	}

	@Override
	public int settleUpWithHost() {
		return bookDAO.settleUpWithHost();
	}

	@Override
	public IncomeVO selectIncomeForOne(UserVO userVO) {
		return bookDAO.selectIncomeForOne(userVO);
	}


}
