package three.people.service;

import java.util.HashMap;
import java.util.List;

import three.people.vo.ImageVO;
import three.people.vo.ReviewVO;
import three.people.vo.UserVO;

public interface ReviewService {

	public int insertReview(ReviewVO reviewVO);
	public List<ReviewVO> myReview(HashMap<String, Object> hashMap);
	public int countMyReview(UserVO userVO);
	public int insertReviewImg(ImageVO imageVO);
}
