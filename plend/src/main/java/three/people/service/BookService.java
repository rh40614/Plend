package three.people.service;

import java.util.HashMap;
import java.util.List;

import three.people.vo.BookVO;

public interface BookService {

	int insertBook(BookVO bookvo);
	int updateSuccess();
	List<BookVO> selectBookByHost(HashMap<String, Integer> page2);
	int cntBook(int uidx);
	int bookCancel(BookVO bookVO);
}
