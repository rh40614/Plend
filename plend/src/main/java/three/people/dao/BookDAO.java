package three.people.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import three.people.vo.BookVO;

@Repository
public class BookDAO {

	@Autowired
	SqlSession sqlSession;
	
	// 07.25 김영민: 예약정보 추가
	public int insertBook(BookVO bookvo) {
		return sqlSession.insert("three.people.mapper.bookMapper.insertBook", bookvo);
	}
	// 08.01 김영민: 이용시간 지난 예약들 이용완료처리하기
	public List<BookVO> usetimeEnd(){
		return sqlSession.selectList("three.people.mapper.bookMapper.usetimeEnd");
	}
	public int successBook(BookVO bookVO) {
		return sqlSession.update("three.people.mapper.bookMapper.successBook", bookVO);
	}
	//2022.08.06 김연희: 호스트 센터 예약 리스트 
	public List<BookVO> selectBookByHost(HashMap<String, Integer> page2) {
		return sqlSession.selectList("three.people.mapper.bookMapper.selectBookByHost", page2);
	}
	public int cntBook(int uidx) {
		return sqlSession.selectOne("three.people.mapper.bookMapper.cntBook", uidx);
	}
}
