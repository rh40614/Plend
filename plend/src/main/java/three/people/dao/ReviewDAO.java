package three.people.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import three.people.vo.ImageVO;
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



}
