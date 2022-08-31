package three.people.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import three.people.vo.ImageVO;
import three.people.vo.PlaceVO;
import three.people.vo.ReportVO;
import three.people.vo.ReviewVO;
import three.people.vo.UserVO;

@Repository
public class ReviewDAO {
	@Autowired
	SqlSession sqlSession;


	public int insertReview(ReviewVO reviewVO) {
		return sqlSession.insert("three.people.mapper.reviewMapper.insertReview", reviewVO);
	}
	public int updateReivew(ReviewVO reviewVO) {
		return sqlSession.update("three.people.mapper.reviewMapper.updateReivew", reviewVO);
	}
	// 마이리뷰리스트 불러오기
	public List<ReviewVO> myReview(HashMap<String, Object> hashMap){
		return sqlSession.selectList("three.people.mapper.reviewMapper.myReview", hashMap);
	}
	public int countMyReview(UserVO userVO) {
		return sqlSession.selectOne("three.people.mapper.reviewMapper.countMyReview", userVO);
	}
	
	//리뷰이미지 등록
	public int insertReviewImg(ImageVO imageVO) {
		return sqlSession.insert("three.people.mapper.reviewMapper.insertReviewImg", imageVO);
	}
	//리뷰 하나만 들고오기, 이미지까진
	public ReviewVO reviewOne(ReviewVO reviewVO) {
		return sqlSession.selectOne("three.people.mapper.reviewMapper.reviewOne", reviewVO);
	}
	public List<ImageVO> reviewImg(ReviewVO reviewVO){
		return sqlSession.selectList("three.people.mapper.reviewMapper.reviewImg", reviewVO);
	}
	// 리뷰수정, 이미지까지
	public int reviewModify(ReviewVO reviewVO) {
		return sqlSession.update("three.people.mapper.reviewMapper.reviewModify", reviewVO);
	}
	public int reviewImgModify(ImageVO imageVO) {
		return sqlSession.delete("three.people.mapper.reviewMapper.reviewImgModify", imageVO);
	}
	// 리뷰삭제
	public int reviewDelete(ReviewVO reviewVO) {
		return sqlSession.update("three.people.mapper.reviewMapper.reviewDelete", reviewVO);
	}
	//리뷰신고
	public int insertReviewReport(ReportVO reportVO) {
		return sqlSession.insert("three.people.mapper.reviewMapper.insertReviewReport", reportVO);
	}
	//장소에 대한 리뷰 로딩
	public List<ReviewVO> selectReviewByHost(HashMap<String,Integer> page) {
		return sqlSession.selectList("three.people.mapper.reviewMapper.selectReviewByHost", page);
	}
	//호스트가 가진 장소에 대한 리뷰갯수 
	public int cntReview(int uidx) {
		return sqlSession.selectOne("three.people.mapper.reviewMapper.cntReview", uidx);
	}
	// 해당 장소에 대한 리뷰, 갯수
	public List<ReviewVO> selectPlaceReview(HashMap<String,Object> hashMap){
		return sqlSession.selectList("three.people.mapper.reviewMapper.selectPlaceReview",hashMap);
	}
	public int countPlaceReview(ReviewVO reviewVO) {
		return sqlSession.selectOne("three.people.mapper.reviewMapper.countPlaceReview", reviewVO);
	}
	
	public int avgRevew(PlaceVO placeVO) {
		return sqlSession.selectOne("three.people.mapper.reviewMapper.avgRevew", placeVO);
	}
	public List<ReviewVO> reviewAll() {
		return sqlSession.selectList("three.people.mapper.reviewMapper.reviewAll");
	}
	public ImageVO selectImageOne(ReviewVO reviewVO) {
		return sqlSession.selectOne("three.people.mapper.reviewMapper.selectImageOne", reviewVO );
	}
	public List<ImageVO> reviewImages(ReviewVO reviewVO) {
		return sqlSession.selectList("three.people.mapper.reviewMapper.selectImageOne", reviewVO );
	}
	public List<ReviewVO> placeReviewAll(HashMap<String,Object> hashMap){
		return sqlSession.selectList("three.people.mapper.reviewMapper.placeReviewAll", hashMap );
	}

}
