package three.people.service;

import java.util.HashMap;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import three.people.dao.ReviewDAO;
import three.people.vo.ImageVO;
import three.people.vo.PlaceVO;
import three.people.vo.ReportVO;
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

	@Override
	public int reviewModify(ReviewVO reviewVO) {
		return reviewDAO.reviewModify(reviewVO);
	}

	@Override
	public int reviewImgModify(ImageVO imageVO) {
		return reviewDAO.reviewImgModify(imageVO);
	}

	@Override
	public int reviewDelete(ReviewVO reviewVO) {
		return reviewDAO.reviewDelete(reviewVO);
	}

	@Override
	public int insertReviewReport(ReportVO reportVO) {
		return reviewDAO.insertReviewReport(reportVO);
	}

	@Override
	public List<ReviewVO> selectReviewByHost(HashMap<String, Integer> page) {
		
		List<ReviewVO> result = reviewDAO.selectReviewByHost(page);
		//일자 자르기
		for(ReviewVO r: result) {
			r.setDate(r.getDate().substring(0,10));
		}
		
		return result;
	}

	@Override
	public int cntReview(int uidx) {
		return reviewDAO.cntReview(uidx);
	}

	@Override
	public List<ReviewVO> selectPlaceReview(HashMap<String, Object> hashMap) {
		return reviewDAO.selectPlaceReview(hashMap);
	}

	@Override
	public int countPlaceReview(ReviewVO reviewVO) {
		return reviewDAO.countPlaceReview(reviewVO);
	}

	public int avgRevew(PlaceVO placeVO) {
		return reviewDAO.avgRevew(placeVO);
	}

	@Override
	public List<ReviewVO> reviewAll() {
		return reviewDAO.reviewAll();
	}

	@Override
	public ImageVO selectImageOne(ReviewVO reviewVO) {
		return reviewDAO.selectImageOne(reviewVO);
	}
	
	
	@Override
	public int[] RandomReview(List<ReviewVO> methodList) {
		
		
		int listSize = methodList.size();
		
		Random random = new Random();
		//인덱스 값을 담을 배열 생성 9개 이상
		int[] idx = new int[9];
		//객체가 9개이하 6개 이상일 경우 
		int[] idxOver6 = new int[6];
		//객체가 3개 이상 6개 이하일 경우 
		int[] idxOver3 = new int[6];
		
		
		
		if(listSize <6) {
			//1. 랜덤으로 뽑아낼 리스트에 객체가 3개 이상  6개 이하일 경우 
			for(int i=0; i<idxOver3.length; i++) {
				
				if(i!=0) {
					boolean flag = true;
					while(flag) {
						int randomNum = random.nextInt(listSize);
						boolean checkSame = false;
						for(int j=0; j<i; j++) {
							if(idxOver3[j]==randomNum) {
								checkSame = true;	 
								break;
							}
						}
						if(!checkSame) {
							idxOver3[i] = randomNum;
							flag = false;
						}
					}
				}else {
					int randomNum = random.nextInt(listSize);
					idxOver3[i] = randomNum;
				}
			}
			return idxOver3;
			
		}else if(listSize<9) {
			
			//2. 랜덤으로 뽑아낼 리스트에 객체가 6개 이상  9개 이하일 경우 
			for(int i=0; i<idxOver6.length; i++) {
				
				if(i!=0) {
					boolean flag = true;
					while(flag) {
						int randomNum = random.nextInt(listSize);
						boolean checkSame = false;
						for(int j=0; j<i; j++) {
							if(idxOver6[j]==randomNum) {
								checkSame = true;	 
								break;
							}
						}
						if(!checkSame) {
							idxOver6[i] = randomNum;
							flag = false;
						}
					}
				}else {
					int randomNum = random.nextInt(listSize);
					idxOver6[i] = randomNum;
				}
			}
			
			return idxOver6;
			
		}else if(listSize > 0) {
			
			//3. 랜덤으로 뽑아낼 리스트에 객체가 9개 이상일 경우 
			for(int i=0; i<idx.length; i++) {
				
				if(i!=0) {
					boolean flag = true;
					while(flag) {
						//새로운 수 생성 
						int randomNum = random.nextInt(listSize);
						//기존의 배열에 새로 넣으려고 하는  randomNum이 있는지 비교
						boolean checkSame = false;
						for(int j=0; j<i; j++) {
							if(idx[j]==randomNum) {
								//이미 같은 값이 존재한다면 for문 나가서 while문 부터 다시 돌기
								checkSame = true;	 
								break;
							}
						}
						//기존의 배열에 존재하지 않는 값이면 위의 for문을 나와서 아래의 if문을 탄다.배열에 그 값을 넣고 다시 첫번째 for 문으로 가기 
						//NOTE: 조건문은 조건식이 true일때 돈다. 따라서 checkSame이 현재 false이고 조건식은  (!false)가 되므로(true)이다. 따라서 if의 조건식이 true가 되므로 실행문을 타게된다.   
						if(!checkSame) {
							idx[i] = randomNum;
							flag = false;
						}
					}
				//첫번째 값은 무조건 넣기 (i=0)	
				}else {
					int randomNum = random.nextInt(listSize);
					idx[i] = randomNum;
				}
			}
			return idx;
		}else {
			int[] nothing =new int[1];
			return nothing;
		}
			
	}

	@Override
	public List<ImageVO> reviewImages(ReviewVO reviewVO) {
		return reviewDAO.reviewImages(reviewVO);
	}

	@Override
	public List<ReviewVO> placeReviewAll(HashMap<String, Object> hashMap) {
		return reviewDAO.placeReviewAll(hashMap);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
