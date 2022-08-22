package three.people.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import three.people.vo.BookVO;
import three.people.vo.EventVO;
import three.people.vo.HeartVO;
import three.people.vo.ImageVO;
import three.people.vo.PlaceVO;
import three.people.vo.QnaVO;
import three.people.vo.SearchVO;
import three.people.vo.UserVO;


@Repository
public class PlaceDAO {

	@Autowired
	SqlSession sqlSession;
	
	String namespace="three.people.mapper.placeMapper";
	
	public List<PlaceVO> selectPlaceAll(HashMap<String, Object> page) {
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
	public List<PlaceVO> selectPlace(UserVO userVO) {
		List<PlaceVO> result = sqlSession.selectList(namespace+".selectPlace", userVO);
		return result;
	}

	//07.27 김영민: 찜목록 등록/삭제 하기/리스트 불러오기
	public int likeAdd(HeartVO heartvo) {
		return sqlSession.insert(namespace+".likeAdd", heartvo);
	}
	public int likeDelete(HeartVO heartvo) {
		return sqlSession.delete(namespace+".likeDelete", heartvo);
	}
	public List<HeartVO> selectHeart(HeartVO heartvo){
		return sqlSession.selectList(namespace+".selectHeart", heartvo);
	}

	//07.27 김연희 : 랜덤용 할인 리스트 
	public List<PlaceVO> eventPlace(UserVO userVO) {			
		List<PlaceVO> result = sqlSession.selectList(namespace+".eventPlace", userVO);
		return result;
	}
	//08.01 김연희 : 장소 검색
	public List<PlaceVO> filter_search(PlaceVO placeVO){
		return sqlSession.selectList(namespace+".filter_search", placeVO);
	}
	
	//08.15 김영민: 장소 삭제
	public int deletePlace(PlaceVO placeVO) {
		return sqlSession.update(namespace+".deletePlace", placeVO);
	}
	//08.16 김영민: 헤더 검색 장소
	public List<PlaceVO> searchPlace( HashMap<String, Object> search){
		return sqlSession.selectList(namespace+".searchPlace", search);
	}
	//08.22 김연희 : 찜한 사람 수 
	public int countHeart(PlaceVO placeVO) {
		return sqlSession.selectOne(namespace+".countHeart", placeVO);
	}
	//08.22 김연희 : 해쉬태그 리스트 
	public List<PlaceVO> hashList(String[] tag) {
		return sqlSession.selectList(namespace+".hashList", tag);
	}
	
}
