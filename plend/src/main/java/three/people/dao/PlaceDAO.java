package three.people.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import three.people.vo.BookVO;
import three.people.vo.ImageVO;
import three.people.vo.PlaceVO;
import three.people.vo.QnaVO;
import three.people.vo.SearchVO;


@Repository
public class PlaceDAO {

	@Autowired
	SqlSession sqlSession;
	
	String namespace="three.people.mapper.placeMapper";
	
	public List<PlaceVO> selectPlaceAll(HashMap<String, Integer> page) {
		List<PlaceVO> result = sqlSession.selectList(namespace+".selectPlaceAll", page);
		return result;
	}
	
	public int cntPlace(PlaceVO placeVO) {
		int result = sqlSession.selectOne(namespace+".cntPlace", placeVO);
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
	// 07.25 김영민: 예약정보 추가
	public int insertBook(BookVO bookvo) {
		return sqlSession.insert(namespace+".insertBook", bookvo);
	}
	// 07.26 김영민: 이미지정보 가져오기
	public List<ImageVO> selectImage(PlaceVO placevo){
		return sqlSession.selectList(namespace+".selectImage", placevo);
	}
	//07.27 김연희 : 카테고리별 장소 가지고 오기
	public List<PlaceVO> categoryPlace(PlaceVO placeVO){
		List<PlaceVO> result = sqlSession.selectList(namespace+".categoryPlace", placeVO);
		return result;
	} 
	//07.27 김연희 : 장소 썸네일용 이미지 하나 
	public ImageVO selectImageOne(PlaceVO placeVO) {
		return sqlSession.selectOne(namespace+".selectImageOne", placeVO);
	}
	//07.27 김연희 : 랜덤용 장소 리스트 
	public List<PlaceVO> selectPlace() {
		List<PlaceVO> result = sqlSession.selectList(namespace+".selectPlace");
		return result;
	}
	//07.27 김연희 : 랜덤용 할인 리스트 
		public List<PlaceVO> eventPlace() {
			List<PlaceVO> result = sqlSession.selectList(namespace+".eventPlace");
			return result;
		}
	
}
