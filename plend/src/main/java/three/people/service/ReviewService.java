package three.people.service;

import java.util.HashMap;
import java.util.List;

import three.people.vo.ImageVO;
import three.people.vo.PlaceVO;
import three.people.vo.ReportVO;
import three.people.vo.ReviewVO;
import three.people.vo.UserVO;

public interface ReviewService {

	public int insertReview(ReviewVO reviewVO);
	public List<ReviewVO> myReview(HashMap<String, Object> hashMap);
	public int countMyReview(UserVO userVO);
	public int insertReviewImg(ImageVO imageVO);
	public ReviewVO reviewOne(ReviewVO reviewVO);
	public List<ImageVO> reviewImg(ReviewVO reviewVO);
	public int reviewModify(ReviewVO reviewVO);
	public int reviewImgModify(ImageVO imageVO);
	public int reviewDelete(ReviewVO reviewVO);
	public int insertReviewReport(ReportVO reportVO);
	public List<ReviewVO> selectReviewByHost(HashMap<String,Integer> page);
	public int cntReview(int uidx);
	List<ReviewVO> selectPlaceReview(HashMap<String,Object> hashMap);
	int countPlaceReview(ReviewVO reviewVO);
	public int avgRevew(PlaceVO placeVO);
	public List<ReviewVO> reviewAll();
	public ImageVO selectImageOne(ReviewVO reviewVO);
	public int[] RandomReview(List<ReviewVO> methodList);
	public List<ImageVO> reviewImages(ReviewVO reviewVO);
	//08.26 김연희 장소에 대한 리뷰 전체
	public List<ReviewVO> placeReviewAll(HashMap<String,Object> hashMap);
}
