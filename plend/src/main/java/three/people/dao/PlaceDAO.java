package three.people.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import three.people.vo.ImageVO;
import three.people.vo.PlaceVO;
import three.people.vo.QnaVO;
import three.people.vo.SearchVO;


@Repository
public class PlaceDAO {

	@Autowired
	SqlSession sqlSession;
	
	String namespace="three.people.mapper.placeMapper";
	
	public List<PlaceVO> selectPlaceAll(SearchVO searchVO) {
		List<PlaceVO> result = sqlSession.selectList(namespace+".selectPlaceAll", searchVO);
		return result;
	}
	
	public int cntPlace(PlaceVO pidx) {
		int result = sqlSession.selectOne(namespace+".cntPlace", pidx);
		return result;
	}
	
	//07.20 김영민: 한 장소 데이터 가져오기
	public PlaceVO placeOne(PlaceVO placevo) {
		return sqlSession.selectOne(namespace+".placeOne", placevo);
	}
	// 07.20 김영민: qna 입력
	public int insertQnA(QnaVO qnavo) {
		return sqlSession.insert(namespace+".insertQnA", qnavo);
	}
	// 07.20 김영민: 글에 해당하는 QnA 선택
	public List<QnaVO> selectQnA(PlaceVO placevo){
		return sqlSession.selectList(namespace+".selectQnA", placevo);
	}
	// 07.22 김영민: qna 질문/답변 수정
	public int qnaModify(QnaVO qnavo) {
		return sqlSession.update(namespace+".qnaModify", qnavo);
	}
	// 07.22 김영민: qna 삭제
	public int deleteQnA(QnaVO qnavo) {
		return sqlSession.update(namespace+".deleteQnA", qnavo);
	}
}
