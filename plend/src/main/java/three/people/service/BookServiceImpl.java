package three.people.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import three.people.dao.BookDAO;
import three.people.vo.BookVO;
import three.people.vo.IncomeVO;
import three.people.vo.PlaceVO;

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
		
		result = successBookUpdateY(bookList);
		return result;
	}
	
	public List<BookVO> useTimeEnd(){
		return bookDAO.usetimeEnd();
	}
	public int successBookUpdateY(List<BookVO> bookList) {
		int result = 0;
		for(BookVO book : bookList) {
			result = bookDAO.successBook(book);
		}
		return result;
	}
	public IncomeVO calcIncome(List<BookVO> bookList) {
		IncomeVO incomeVO = new IncomeVO();
		for(BookVO book : bookList) {
			incomeVO.setTotalIncome(incomeVO.getTotalIncome() + book.getTotalPrice());
			incomeVO.setTotalPeople(incomeVO.getTotalPeople() + book.getCntPeople());
			incomeVO.setUidx(book.getUidx());
		}
		return incomeVO;
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
	
	

}
