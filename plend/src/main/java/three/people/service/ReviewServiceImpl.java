package three.people.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import three.people.dao.ReviewDAO;
import three.people.vo.ImageVO;
import three.people.vo.ReviewVO;
import three.people.vo.UserVO;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	ReviewDAO reviewDAO;
	
	@Override
	public int insertReview(ReviewVO reviewVO) {
		reviewDAO.insertReview(reviewVO);
		return reviewDAO.updateReivew(reviewVO);
	}

	@Override
	public List<ReviewVO> myReview(HashMap<String, Object> hashMap) {
		return reviewDAO.myReview(hashMap);
	}

	@Override
	public int countMyReview(UserVO userVO) {
		return reviewDAO.countMyReview(userVO);
	}

	@Override
	public int insertReviewImg(ImageVO imageVO) {
		return reviewDAO.insertReviewImg(imageVO);
	}

	@Override
	public ReviewVO reviewOne(ReviewVO reviewVO) {
		return reviewDAO.reviewOne(reviewVO);
	}

	@Override
	public List<ImageVO> reviewImg(ReviewVO reviewVO) {
		return reviewDAO.reviewImg(reviewVO);
	}
}
