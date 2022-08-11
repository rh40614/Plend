package three.people.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import three.people.dao.BookDAO;
import three.people.vo.BookVO;

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
		List<BookVO> bookList = bookDAO.usetimeEnd();
		int result = 0;
		for(BookVO book:bookList) {
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

}
